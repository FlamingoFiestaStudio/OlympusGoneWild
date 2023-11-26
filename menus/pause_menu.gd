extends Control

var game_paused : bool = false : get = _get_game_paused, set = _set_game_paused

func _ready():
	hide()

func _get_game_paused():
	return game_paused
	
func _set_game_paused(new_state: bool):
	game_paused = new_state
	get_tree().paused = game_paused
	show() if game_paused else hide()

func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused

func _on_resume_btn_pressed():
	await get_tree().create_timer(0.1).timeout
	game_paused = false


func _on_quit_btn_pressed():
	game_paused = false
	get_tree().change_scene_to_file("res://menus/menu.tscn")
