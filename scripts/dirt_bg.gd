extends Parallax2D



func _ready() -> void:
	var camera_position = $"../../Camera Man".Camera_position
	if camera == null:
		push_warning("Please assign a Camera2D to the Parallax2D node!")
		return

	var viewport_size := get_viewport_rect().size
	var viewport_height := viewport_size.y / camera.zoom.y
	var viewport_width := viewport_size.x / camera.zoom.x

	# Position the Parallax2D at the bottom quarter of the camera view.
	global_position.y = (
		camera.global_position.y
		+ viewport_height / 2.0
		- viewport_height / 4.0
	)

	# Make sure the repeated texture covers the viewport.
	if repeat_size.x > 0.0:
		var count_needed := int(ceil(viewport_width / repeat_size.x)) + 4
		repeat_times = count_needed
		screen_offset.x = -(count_needed * repeat_size.x) / 2.0
