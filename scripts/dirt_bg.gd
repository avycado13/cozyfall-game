extends TextureRect

func _ready():
	# Sets the stretch mode to Tile programmatically
	stretch_mode = TextureRect.STRETCH_TILE
	
	# Expands the width to match the viewport width while keeping its texture height
	size.x = get_viewport_rect().size.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
