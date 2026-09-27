extends Node2D

const MINERAL_TEXTURE = preload("res://assets/terrain/ores.png")
# Sprite order in ores.png: red iron, pale potassium, blue water.
const MINERAL_TYPES: Array[StringName] = [&"iron", &"potassium", &"water"]
const MINERAL_SIZE := Vector2(16, 16)

@export var spawn_count := 8
@export var spawn_area := Rect2(-144, 16, 288, 88)
@export var spawn_spacing := Vector2i(24, 24)

var mineral_counts := {
	&"iron": 0,
	&"potassium": 0,
	&"water": 0,
}

var _random := RandomNumberGenerator.new()


func _ready() -> void:
	_random.randomize()
	spawn_minerals()


func spawn_minerals() -> void:
	var available_positions := _get_spawn_positions()
	var amount := mini(spawn_count, available_positions.size())

	for index in amount:
		var position_index := _random.randi_range(0, available_positions.size() - 1)
		var mineral_position: Vector2 = available_positions.pop_at(position_index)
		var mineral_type_index := _random.randi_range(0, MINERAL_TYPES.size() - 1)
		_create_mineral(mineral_type_index, mineral_position)


func _physics_process(_delta: float) -> void:
	# area_entered fires before a new root is placed if it overlaps an ore.
	# Check existing overlaps as well so placing that root still collects it.
	for mineral in get_children():
		if mineral.get_meta("collected", false):
			continue
		for area in mineral.get_overlapping_areas():
			_on_mineral_area_entered(area, mineral)


func _get_spawn_positions() -> Array[Vector2]:
	var positions: Array[Vector2] = []
	var start := spawn_area.position + Vector2(spawn_spacing) / 2.0
	var end := spawn_area.end
	var y := start.y

	while y < end.y:
		var x := start.x
		while x < end.x:
			positions.append(Vector2(x, y))
			x += spawn_spacing.x
		y += spawn_spacing.y

	return positions


func _create_mineral(type_index: int, mineral_position: Vector2) -> Area2D:
	var mineral := Area2D.new()
	mineral.name = "Mineral_%s" % MINERAL_TYPES[type_index]
	mineral.position = mineral_position
	mineral.collision_layer = 0
	mineral.collision_mask = 1
	mineral.monitorable = false
	mineral.set_meta("mineral_type", MINERAL_TYPES[type_index])

	var sprite := Sprite2D.new()
	sprite.texture = MINERAL_TEXTURE
	sprite.region_enabled = true
	sprite.region_rect = Rect2(Vector2(type_index * 16, 0), MINERAL_SIZE)
	mineral.add_child(sprite)

	var collision := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 6.0
	collision.shape = shape
	mineral.add_child(collision)

	mineral.area_entered.connect(_on_mineral_area_entered.bind(mineral))
	add_child(mineral)
	return mineral


func _on_mineral_area_entered(root: Area2D, mineral: Area2D) -> void:
	if not root.is_in_group("root_segment") or not root.placed:
		return
	if mineral.get_meta("collected", false):
		return

	mineral.set_meta("collected", true)
	mineral.set_deferred("monitoring", false)
	var mineral_type: StringName = mineral.get_meta("mineral_type")
	mineral_counts[mineral_type] += 1
	var tree := get_node_or_null("../Tree")
	if tree != null:
		match mineral_type:
			&"iron":
				tree.iron += 1
			&"potassium":
				tree.potassium += 1
			&"water":
				tree.water += 1
	mineral.queue_free()
