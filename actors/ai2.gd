extends Node2D

onready var player2_paddle = $Player2
onready var player2_paddle_sprite = $Player2/Sprite
onready var ball = get_tree().get_nodes_in_group("ball_group")[0]

var velocity: Vector2
var ball_position: Vector2

func _physics_process(delta):
	if ball != null:
		ball_position = ball.get_global_position()
		var player2_position = player2_paddle_sprite.get_global_position()
		velocity.y = lerp(player2_position.y, ball_position.y, 0.1)
		velocity.y = velocity.y - player2_position.y
		player2_paddle.move_and_slide(velocity, Vector2.UP)
	else:
		pass



