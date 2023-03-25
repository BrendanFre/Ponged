extends KinematicBody2D
class_name ball
signal goal_scored(scorer)

onready var sprite = $Sprite
onready var collider = $CollisionShape2D
onready var ball_starting = $Sprite.get_global_position()
onready var sound = $pop

var velocity: Vector2 = Vector2(0,0)
var max_speed = 600


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	move_and_slide(velocity)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		sound.play()
		velocity = velocity.bounce(collision_info.normal) * 1.1
		velocity = velocity.clamped(max_speed)
#		velocity.x = clamp(velocity.x, 1, 500)
#		velocity.y = clamp(velocity.y, 1, 500)
		print(velocity)



func _handle_goal(goal):
	var goal_owner = goal
	match goal_owner:
		"Goal_Player1":
			print("Player 2 scored!")
			emit_signal("goal_scored", "player2")
		"Goal_Player2":
			print("Player 1 scored!")
			emit_signal("goal_scored", "player1")
	
	
