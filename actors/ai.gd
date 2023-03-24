extends Node2D

signal ball_located(ball_location)
onready var paddle = $Player2


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Ball":
		var ball = body
		var ball_location: Vector2 = Vector2(ball.global_position.x,ball.global_position.y )
		emit_signal("ball_located",ball_location)
		print("Ball Entered detection")
	pass # Replace with function body.
