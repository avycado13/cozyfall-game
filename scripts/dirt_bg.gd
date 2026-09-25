extends Parallax2D

@export var camera: Camera2D

func _ready():
	if not camera:
		push_warning("Please assign a Camera2D to the Parallax2D node!")
		return
		
	# 1. Get the vertical size of the viewport (taking camera zoom into account)
	var viewport_height = get_viewport_rect().size.y / camera.zoom.y
	var viewport_size = get_viewport_rect().size / camera.zoom

	
	# 2. Calculate the Y position for the bottom 1/4th of the screen
	# (Center of camera + half the viewport height drops us to the very bottom,
	# then we subtract 1/4th of the screen height to move it up slightly)
	var bottom_quarter_y = camera.global_position.y + (viewport_height / 2.0) - (viewport_height / 4.0)
	
	# 3. Anchor the background to this vertical position
	global_position.y = bottom_quarter_y
	
	if repeat_size.x > 0:
		var count_needed = ceil(viewport_size.x / repeat_size.x) + 4
		repeat_times = count_needed
		
		screen_offset.x = -(count_needed * repeat_size.x) / 2.0
