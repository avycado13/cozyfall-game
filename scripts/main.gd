extends Node2D

const DAYS_IN_MONTH := [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
const MONTH_NAMES := ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
const WINTER_NUTRIENTS_REQUIRED := 10

var month := 11
var day := 1
var year := 1


func _ready() -> void:
	$UI/Clock.day_passed.connect(_on_day_passed)
	_update_date()


func _on_day_passed() -> void:
	day += 1
	if day > DAYS_IN_MONTH[month - 1]:
		day = 1
		month += 1
		if month > 12:
			month = 1
			year += 1
	_update_date()

	if month == 12 and day == 1:
		var tree := $Tree
		if tree.iron < WINTER_NUTRIENTS_REQUIRED or tree.water < WINTER_NUTRIENTS_REQUIRED or tree.potassium < WINTER_NUTRIENTS_REQUIRED:
			tree.health = 0
			$UpgradeMenu.hide()
			$PauseScreen.process_mode = Node.PROCESS_MODE_DISABLED
			$PauseScreen.hide()
			$UI.show_death()
			return

	$meow.reset_roots()
	$Minerals.regenerate()


func _update_date() -> void:
	var season := "Winter" if month == 12 or month <= 2 else "Fall" if month >= 9 else "Spring" if month <= 5 else "Summer"
	$UI.update_date("%s  %s %d, Year %d" % [season, MONTH_NAMES[month - 1], day, year])
