extends Control

var game_paused: bool = false : get = _get_game_paused, set = _set_game_paused

func _ready() -> void:
	hide()

func _get_game_paused() -> bool:
	return game_paused
	
func _set_game_paused(new_state: bool) -> void:
	game_paused = new_state
	get_tree().paused = game_paused
	show() if game_paused else hide()

func _input(event: InputEvent)  -> void:
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused

func _on_resume_button_pressed()  -> void:
	game_paused = false

func _on_quit_button_pressed()  -> void:
	game_paused = false
	get_tree().change_scene_to_file("res://menus/menu.tscn")
