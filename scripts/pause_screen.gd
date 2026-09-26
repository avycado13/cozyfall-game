extends CanvasLayer
var button_wait = .2
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	self.visible = false
	#$VBoxContainer.scale = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		self.visible = !self.visible
	if $"VBoxContainer/Save and Quit".button_pressed:
		await get_tree().create_timer(button_wait).timeout
		get_tree().quit()
		
	#get_tree().paused = self.visible 

	if self.visible == true and paused == false:
		self.get_tree().paused = true
		paused = true

	elif self.visible == false and paused == true:
		self.get_tree().paused = false
		paused = false

	if $VBoxContainer/Resume.button_pressed:
		await get_tree().create_timer(button_wait).timeout
		self.visible = false
