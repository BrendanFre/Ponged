extends Node2D

onready var goal1 = $Goal_Player1
onready var goal2 = $Goal_Player2
onready var ball = $Ball

var player1_score: int = 0
var player2_score: int = 0

signal game_over(winner)


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.connect("goal_scored", self, "_add_score")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _add_score(goal_scored_by):
	self.add_child(ball)
	var winner: String
	match goal_scored_by:
		"player1":
			player1_score += 1
			winner = "Player 1"
		"player2":
			player2_score += 1
			winner = "Player 2"
	
	if player1_score == 3 or player2_score == 3:
		emit_signal("game_over", winner)
		
	print("scored by ", goal_scored_by, " Total Score: Player 1 ", player1_score, " : ", player2_score, " Player 2")
