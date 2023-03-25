extends MarginContainer

func _ready():
	get_tree().paused = false




func _on_exit_pressed():
	get_tree().change_scene("res://assets/main_menu.tscn")
