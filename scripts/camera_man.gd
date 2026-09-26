extends CharacterBody2D

var max_speed = 500
var acceleration = 500

@onready var Camera = $Camera
func _process(delta: float) -> void:
	if self.position.y <-50:
		self.position.y = -50
	if self.position.x <-150:
		self.position.x = -150
	if self.position.x > 150:
		self.position.x = 150

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction=Input.get_vector("left","right","up","down")
	var target_velocity=direction*max_speed
	if direction!=Vector2.ZERO:
		velocity=velocity.move_toward(target_velocity,acceleration*delta)
	else:
		velocity=velocity.move_toward(Vector2(0,0),acceleration*10*delta)
#move and slide
	move_and_slide()
