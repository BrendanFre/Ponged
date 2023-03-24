extends Node2D

onready var goal1 = $Goal_Player1
onready var goal2 = $Goal_Player2
onready var ball = get_tree().get_nodes_in_group("ball_group")[0]
onready var ai = $ai_manager/Player2
onready var player2_paddle_sprite = $ai_manager/Player2/Sprite
onready var game_timer = $game_timer


var player1_score: int = 0
var player2_score: int = 0
var player_winner: String

signal game_over(winner)


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.connect("goal_scored", self, "_add_score")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !ball:
		var ballposition = ball.get_global_position()
		ai.move_player2(ballposition, delta)
	else:
		pass
	
	# Initiate the chase



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
	
	check_gameover(player1_score, player2_score)
	
	ball.set_position(ball.ball_starting)
	ball.velocity = Vector2.ZERO
	game_timer.start(3)
	
	if player1_score == 3 or player2_score == 3:
		emit_signal("game_over", winner)
		
	print("scored by ", goal_scored_by, " Total Score: Player 1 ", player1_score, " : ", player2_score, " Player 2")


func _on_game_timer_timeout():
	print("timer finished")
	if player1_score <= player2_score:
		ball.velocity= Vector2(-200,0)
		print("Player has least or equal points")
	else:
		ball.velocity = Vector2(200,0)
		print("Player has most points")

func check_gameover(player1_score, player2_score):
	if player1_score == 3:
		print("Player 1 is the winner!")
		player_winner = "Player 1"
	elif player2_score == 3:
		print("Player 2 is the winner!")
		player_winner = "Player 2"
	else:
		return
	print("Winner, winner, chicken dinner!")
