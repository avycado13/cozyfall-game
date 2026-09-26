extends Area2D

var root1 = load("res://assets/roots/roots1.png")
var root2 = load("res://assets/roots/roots2.png")
var root3 = load("res://assets/roots/roots3.png")
var random_texture = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random_texture = int(randf_range(1,4))
	print(random_texture)
	match random_texture:
		1:
			$TextureRect.texture = root1
		2:
			$TextureRect.texture = root2
		3:
			$TextureRect.texture = root3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
