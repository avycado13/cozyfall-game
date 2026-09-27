extends CharacterBody2D

const MAX_STAGE := 7
const GROWTH_IRON_COST := 3
const GROWTH_WATER_COST := 2
const GROWTH_POTASSIUM_COST := 1

var health = 100
var Stage = 1
var iron = 0
var water = 0
var potassium = 0


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
