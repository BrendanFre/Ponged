extends MarginContainer

export (Color) var highlighted
var standard: Color
onready var new_game = $"Control/HBoxContainer/VBoxContainer/MenuOptions/New Game"
onready var exit = $"Control/HBoxContainer/VBoxContainer/MenuOptions/Exit"

func _on_New_Game_mouse_entered():
	standard = new_game.modulate
	new_game.modulate = highlighted
	pass # Replace with function body.

func _on_New_Game_mouse_exited():
	new_game.modulate = standard
	pass # Replace with function body.


func _on_Exit_mouse_entered():
	standard = exit.modulate
	exit.modulate = highlighted


func _on_Exit_mouse_exited():
	exit.modulate = standard
	pass # Replace with function body.
