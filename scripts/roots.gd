extends Node2D

var branch = preload("res://scenes/stick.tscn")
var current_pos = Vector2.ZERO
var stick_joint_pos = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
var instance
func _ready() -> void:

	init_stick()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#current_pos = $stick.current_pos
	#if $stick.joint_pos != null:
		#stick_joint_pos = $stick.joint_pos
	#else:
		#stick_joint_pos = current_pos
	##print(rad_to_deg(instance.rotation ))
	print(current_pos)
	if Input.is_action_just_pressed("ui_accept"):
		current_pos -= Vector2(sin(instance.rotation),-cos(instance.rotation)) * 16
		instance.modulate.a = 1
		instance.placed = true
		# Save the placed section's endpoint before creating the next one
		current_pos = instance.get_node("Marker2D").global_position
		init_stick()
	elif Input.is_action_just_pressed("rotate_left") and rad_to_deg(instance.rotation ) < 50:
		instance.rotation += deg_to_rad(30)
	elif Input.is_action_just_pressed("rotate_right") and rad_to_deg(instance.rotation ) > -50:
		instance.rotation -= deg_to_rad(30)
		
	
func reset_roots() -> void:
	for stick in get_children():
		remove_child(stick)
		stick.queue_free()
	current_pos = Vector2.ZERO
	stick_joint_pos = Vector2.ZERO
	init_stick()


func init_stick():
	instance = branch.instantiate()
	instance.rotation = deg_to_rad(15)
	instance.modulate.a = 0.5
	add_child(instance)
	instance.global_position = current_pos
	
func update_stick():
	
	instance.rotation = deg_to_rad(15)
	instance.modulate.a = 0.5
	instance.global_position = current_pos
