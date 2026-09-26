extends CharacterBody2D

var max_speed = 200
var acceleration = 100

@onready var Camera = $Camera
func _process(delta: float) -> void:
	pass

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
