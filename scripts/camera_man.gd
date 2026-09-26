extends CharacterBody2D

var max_speed = 300
var acceleration = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var Camera_position = Vector2(0,0)
func _process(delta: float) -> void:
	Camera_position = $Camera.global_position

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction=Input.get_vector("left","right","up","down")
	var target_velocity=direction*max_speed
	if direction!=Vector2.ZERO:
		velocity=velocity.move_toward(target_velocity,acceleration*delta)
	else:
		velocity=velocity.move_toward(target_velocity,acceleration*delta)
#move and slide
	move_and_slide()
