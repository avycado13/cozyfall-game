@ -5,20 +5,10 @@ const MINERAL_TEXTURE = preload("res://assets/terrain/ores.png")
const MINERAL_TYPES: Array[StringName] = [&"iron", &"potassium", &"water"]
const MINERAL_SIZE := Vector2(16, 16)

<<<<<<< HEAD
<<<<<<< HEAD
@export var spawn_count := 50
@export var spawn_area := Rect2(-144, 16, 288, 500)
=======
=======
>>>>>>> e9889bcece48cd5e5b261c9d2511016e04445dc0
@export var spawn_count := 16
@export var spawn_area := Rect2(-144, 16, 288, 88)
>>>>>>> e9889bcece48cd5e5b261c9d2511016e04445dc0
@export var spawn_spacing := Vector2i(24, 24)
@export var depth_per_day := 24.0

var days_elapsed := 0
var mineral_counts := {
	&"iron": 0,
	&"potassium": 0,
@ -33,16 +23,6 @@ func _ready() -> void:
	spawn_minerals()


func regenerate() -> void:
	# Remove only the ores in the world; mineral_counts and the tree's
	# collected inventory belong to the player and carry over.
	for mineral in get_children():
		remove_child(mineral)
		mineral.queue_free()
	days_elapsed += 1
	spawn_minerals()


func spawn_minerals() -> void:
	var available_positions := _get_spawn_positions()
	var amount := mini(spawn_count, available_positions.size())
@ -66,9 +46,8 @@ func _physics_process(_delta: float) -> void:

func _get_spawn_positions() -> Array[Vector2]:
	var positions: Array[Vector2] = []
	var depth_offset := Vector2(0, days_elapsed * depth_per_day)
	var start := spawn_area.position + Vector2(spawn_spacing) / 2.0 + depth_offset
	var end := spawn_area.end + depth_offset
	var start := spawn_area.position + Vector2(spawn_spacing) / 2.0
	var end := spawn_area.end
	var y := start.y

	while y < end.y:
