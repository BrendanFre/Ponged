extends Area2D
class_name goal

enum goal{
	PLAYER1,
	PLAYER2,
}

export (goal) var goalie

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Goal_body_entered(body):
	var possible_ball = body
	if body.has_method("_handle_goal"):
		body._handle_goal(self.name)
