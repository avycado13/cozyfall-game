@ -1,6 +1,4 @@
extends CanvasLayer
<<<<<<< HEAD
<<<<<<< HEAD
var paused = false
var iron = 0
var water = 0
@ -58,40 +56,3 @@ func _process(delta: float) -> void:
		self.visible = !self.visible
		
	#get_tree().paused = self.visible 
=======
=======
>>>>>>> e9889bcece48cd5e5b261c9d2511016e04445dc0

@onready var tree = get_node("../Tree")
@onready var grow_button: Button = $Panel/Contents/WoodButton
@onready var stage_label: Label = $Panel/Contents/Stage
@onready var cost_label: Label = $Panel/Contents/Cost


func _ready() -> void:
	grow_button.pressed.connect(_on_grow_pressed)
	_refresh()


func _process(_delta: float) -> void:
	_refresh()


func _on_grow_pressed() -> void:
	tree.grow_tree()
	_refresh()


func _refresh() -> void:
	stage_label.text = "Tree Stage %d / %d" % [tree.Stage, tree.MAX_STAGE]
	if tree.Stage == tree.MAX_STAGE:
		cost_label.text = "Fully grown"
		grow_button.text = "Max Stage"
	else:
		cost_label.text = "Cost: %d iron  /  %d water  /  %d potassium" % [tree.GROWTH_IRON_COST, tree.GROWTH_WATER_COST, tree.GROWTH_POTASSIUM_COST]
		grow_button.text = "Grow Tree"
	grow_button.disabled = not tree.can_grow()
<<<<<<< HEAD
>>>>>>> e9889bcece48cd5e5b261c9d2511016e04445dc0
=======
>>>>>>> e9889bcece48cd5e5b261c9d2511016e04445dc0
