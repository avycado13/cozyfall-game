@ -3,22 +3,9 @@ extends CanvasLayer
var iron = 0
var water = 0
var potassium = 0 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DeathScreen/Message/Restart.pressed.connect(_on_restart_pressed)


func update_date(date_text: String) -> void:
	$DatePanel/Details/Date.text = date_text


func show_death() -> void:
	$DeathScreen.show()
	get_tree().paused = true


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
