extends CanvasLayer

var iron = 0
var water = 0
var potassium = 0 
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var tree := get_node_or_null("../Tree")
	if tree == null:
		return
	iron = tree.iron
	water = tree.water
	potassium = tree.potassium
	$VBoxContainer/Iron/Label.text = str("Iron: ",iron)
	$VBoxContainer/Water/Label.text = str("Water: ",water)
	$VBoxContainer/Potassium/Label.text = str("Potassium: ",potassium)
