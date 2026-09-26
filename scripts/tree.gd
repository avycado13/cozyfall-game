extends CharacterBody2D

var health = 100
var Stage = 1


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
