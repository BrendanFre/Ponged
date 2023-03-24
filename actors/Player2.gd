extends KinematicBody2D

enum controller {
	HUMAN,
	COMPUTER
}

var velocity: Vector2 = Vector2(0,0)


export (controller) var current_controller
onready var ai = $ai
onready var sprite = $Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if current_controller == controller.COMPUTER:
		ai.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func move_player2(ball_position, delta):
	var paddle_size: Vector2 = Vector2(self.sprite.texture.get_width(), self.sprite.texture.get_height())
	var ball_pos = ball_position
	var play2_pos = self.sprite.get_global_position()
	if ball_pos.y > play2_pos.y + (paddle_size.y/2 + 10):
		velocity.x = move_toward(play2_pos.y, ball_pos.y, 10)
		print(velocity)
		move_and_collide(velocity)


#func _on_ai_ball_located(ball_location):
#	var ball_signal_location: Vector2 = ball_location
#	var paddle_size: Vector2 = Vector2(sprite.text.get_width(),sprite.texture.get_height())
#	if ball_signal_location.y > self.global_position.y + (paddle_size.y/2 +10):
#		self.global_position.y += 250 * delta
##	var player2_location: Vector 2 = Vector2(self.global_position)
