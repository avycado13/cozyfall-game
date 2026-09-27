extends Node2D

var hour = 9
var minute = 0
var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(_on_timer_timeout)
	$minute.rotation_degrees = -90
	$hour.rotation_degrees = 180
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Timer.wait_time = .25/speed
	if minute == 60 or minute > 60:
		minute = 0
		hour +=1
	

	
func _on_timer_timeout() -> void:
	minute += (1/speed)
	$minute.rotation_degrees += (6/speed)
	$hour.rotation_degrees += (.5/speed)
	#30 secs for 1 hour
	#.5 secs for 1 min
	#6 degress per min
	
