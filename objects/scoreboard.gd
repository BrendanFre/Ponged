extends Panel

onready var player_name = $HBoxContainer/player_name
onready var player_score = $HBoxContainer/player_score

enum players {
	PLAYER_1,
	PLAYER_2,
	COMPUTER,
}

export (players) var ownership

func _ready():
	match ownership:
		players.PLAYER_1:
			player_name.text = "Player 1"
		players.PLAYER_2:
			player_name.text = "Player 2"
		players.COMPUTER:
			player_name.text = "Computer"

func _update_gui(score):
	score = str(score)
	player_score.set_text(score)
