extends CanvasLayer

var iron = 0
var water = 0
var potassium = 0 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	iron = $"../Tree".iron
	water = $"../Tree".water
	potassium = $"../Tree".potassium
	$VBoxContainer/Iron/Label.text = str("Iron: ",iron)
	$VBoxContainer/Water/Label.text = str("Water: ",water)
	$VBoxContainer/Potassium/Label.text = str("Potassium: ",potassium)
