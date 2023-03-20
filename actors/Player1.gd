extends KinematicBody2D

onready var sprite = $Sprite
var player1_color: Color = Color(0, 0.596078, 1)
var player2_color: Color = Color(1, 0, 0)
var cpu_color: Color = Color(0,1,0)
var velocity: Vector2 = Vector2.ZERO
var speed: int = 200

enum controller{
	PLAYER1,
	PLAYER2,
	CPU,
}

export (controller) var controlling_party = controller.PLAYER1

func _ready():
	print(self.name)
	match controlling_party:
		controller.PLAYER1:
			sprite.modulate = player1_color
		controller.PLAYER2:
			sprite.modulate = player2_color
		controller.CPU:
			sprite.modulate = cpu_color

func _physics_process(delta):
	if controlling_party == controller.PLAYER1:
		if Input.is_action_pressed("up"):
			velocity.y = -speed
		elif Input.is_action_pressed("down"):
			velocity.y = speed
		else:
			velocity.y = 0
		move_and_slide(velocity)
