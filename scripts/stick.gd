extends Area2D

var placed = false
var root1 = load("res://assets/roots/roots1.png")
var root2 = load("res://assets/roots/roots2.png")
var root3 = load("res://assets/roots/roots3.png")
var random_texture = 0
var joint_pos = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Joint.input_event.connect(_on_input_event)
	random_texture = int(randf_range(1,4))
	match random_texture:
		1:
			$TextureRect.texture = root1
		2:
			$TextureRect.texture = root2
		3:
			$TextureRect.texture = root3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#joint_pos = $Joint.position
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if Input.is_action_just_pressed("left_click") and placed == true:
		#joint_pos = $Marker2D.position
		joint_pos -= Vector2(sin($Marker2D.rotation),-cos($Marker2D.rotation)) * 16
