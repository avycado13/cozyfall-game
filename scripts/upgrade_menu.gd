extends CanvasLayer
var paused = false
var iron = 0
var water = 0
var potassium = 0
var need_iron = 2
var need_water = 5
var need_potassium = 1
var stage = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	$WoodButton.text = str("Grow Tree ",need_iron,":        ",need_water,":        ",need_potassium,":        ")
	var tree := get_node_or_null("../Tree")
	if tree == null:
		return
	iron = tree.iron
	water = tree.water
	potassium = tree.potassium
	stage = tree.Stage
	match stage:
		1:
			$Tree.play("stage1")
		2:
			$Tree.play("stage2")
		3:
			$Tree.play("stage3")
		4:
			$Tree.play("stage4")
		5:
			$Tree.play("stage5")
		6:
			$Tree.play("stage6")
		7:
			$Tree.play("stage7")
	print(iron, potassium, water)
	if $WoodButton.button_pressed and water > (need_water-1) and iron > (need_iron-1) and potassium >(need_potassium-1):
		print("hi")
		tree.iron -=need_iron
		tree.potassium -=need_potassium
		tree.water -= need_water
		tree.Stage +=1
		need_iron += 2
		need_water += 4
		need_potassium += 3
		
		
	
	
	if Input.is_action_just_pressed("upgrade_menu"):
		self.visible = !self.visible
		
	#get_tree().paused = self.visible 
