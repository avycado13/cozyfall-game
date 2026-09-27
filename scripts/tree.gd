@ -1,10 +1,5 @@
extends CharacterBody2D

const MAX_STAGE := 7
const GROWTH_IRON_COST := 3
const GROWTH_WATER_COST := 2
const GROWTH_POTASSIUM_COST := 1

var health = 100
var Stage = 1
var iron = 10
@ -12,27 +7,43 @@ var water = 10
var potassium = 10


func _ready() -> void:
	_apply_stage()


func can_grow() -> bool:
	return health > 0 and Stage < MAX_STAGE and iron >= GROWTH_IRON_COST and water >= GROWTH_WATER_COST and potassium >= GROWTH_POTASSIUM_COST


func grow_tree() -> bool:
	if not can_grow():
		return false
	iron -= GROWTH_IRON_COST
	water -= GROWTH_WATER_COST
	potassium -= GROWTH_POTASSIUM_COST
	Stage += 1
	_apply_stage()
	return true


func _apply_stage() -> void:
	$Trunk.play("stage%d" % Stage)
	$Leafs.play("stage%d" % Stage)
	for stage_number in range(1, MAX_STAGE + 1):
		get_node("Stage%d" % stage_number).disabled = stage_number != Stage
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		Stage +=1
	match Stage:
		1:
			$Trunk.play("stage1")
			$Leafs.play("stage1")
			$Stage1.disabled = false
		2:
			$Trunk.play("stage2")
			$Leafs.play("stage2")
			$Stage1.disabled = true
			$Stage2.disabled = false
		3:
			$Trunk.play("stage3")
			$Leafs.play("stage3")
			$Stage2.disabled = true
			$Stage3.disabled = false
		4:
			$Trunk.play("stage4")
			$Leafs.play("stage4")
			$Stage3.disabled = true
			$Stage4.disabled = false
		5:
			$Trunk.play("stage5")
			$Leafs.play("stage5")
			$Stage4.disabled = true
			$Stage5.disabled = false
		6:
			$Trunk.play("stage6")
			$Leafs.play("stage6")
			$Stage5.disabled = true
			$Stage6.disabled = false
		7:
			$Trunk.play("stage7")
			$Leafs.play("stage7")
			$Stage6.disabled = true
			$Stage7.disabled = false
func _physics_process(delta: float) -> void:
	pass
