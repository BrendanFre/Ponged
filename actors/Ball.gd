extends KinematicBody2D

signal goal_scored(scorer)

onready var sprite = $Sprite
onready var collider = $CollisionShape2D

var velocity: Vector2 = Vector2(200,0)


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
		velocity = velocity.bounce(collision_info.normal)

func _on_Timer_timeout():

	pass # Replace with function body.

func _handle_goal(goal):
	var goal_owner = goal
	match goal_owner:
		"Goal_Player1":
			print("Player 2 scored!")
			emit_signal("goal_scored", "player2")
			self.queue_free()
		"Goal_Player2":
			print("Player 1 scored!")
			emit_signal("goal_scored", "player1")
			self.queue_free()
	
	
