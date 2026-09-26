extends Node2D

var branch = preload("res://scenes/stick.tscn")
var current_pos = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
var instance
func _ready() -> void:
	init_stick()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	print(rad_to_deg(instance.rotation ))
	
	if Input.is_action_just_pressed("ui_accept"):
		current_pos -= Vector2(sin(instance.rotation),-cos(instance.rotation)) * 16
		instance.modulate.a = 1
		init_stick()
	elif Input.is_action_just_pressed("rotate_left") and rad_to_deg(instance.rotation ) < 50:
		instance.rotation += deg_to_rad(30)
	elif Input.is_action_just_pressed("rotate_right") and rad_to_deg(instance.rotation ) > -50:
		instance.rotation -= deg_to_rad(30)
		
	
func init_stick():
	instance = branch.instantiate()
	instance.position = current_pos
	instance.rotation = deg_to_rad(15)
	instance.modulate.a = 0.5
	add_child(instance)
