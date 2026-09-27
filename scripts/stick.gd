extends Area2D

var placed = false
var root1 = load("res://assets/roots/roots1.png")
var root2 = load("res://assets/roots/roots3.png")
var root3 = load("res://assets/roots/roots3.png")
var random_texture = 0
var joint_found = false
var current_pos = Vector2(0,0)
var joint_pos = Vector2(0,0)
@onready var joint: Area2D = $Joint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("root_segment")
	current_pos -= Vector2(sin(self.rotation),-cos(self.rotation)) * 16
	
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
	#print($Marker2D.global_position)
	#joint_pos = $Joint.position
	if placed == true and joint_found == false:
		joint_pos = $Marker2D.global_position
		joint_found = true


	



func _on_joint_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_click") and placed == true:
		#joint_pos = $Marker2D.position
		get_parent().current_pos = joint.global_position
		get_parent().update_stick()
		print(get_parent().current_pos)
		
