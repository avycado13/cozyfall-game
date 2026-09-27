extends Node2D

signal day_passed

const SECONDS_PER_HOUR := 15.0

var hour = 9
var minute = 0

func _ready() -> void:
	$Timer.wait_time = SECONDS_PER_HOUR / 60.0
	$Timer.timeout.connect(_on_timer_timeout)
	$minute.rotation_degrees = -90
	$hour.rotation_degrees = 180


func _on_timer_timeout() -> void:
	minute += 1
	$minute.rotation_degrees += 6
	$hour.rotation_degrees += 0.5
	while minute >= 60:
		minute -= 60
		hour += 1
		# The clock starts at 9; a new day begins when it returns to 9.
		if hour >= 33:
			hour = 9
			day_passed.emit()
