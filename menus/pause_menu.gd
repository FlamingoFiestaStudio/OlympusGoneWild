extends Control

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		_update_visibility()

func _ready():
	hide()

func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused

func _update_visibility():
	if game_paused:
		show()
	else:
		hide()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_resume_button_pressed():
	game_paused = false
