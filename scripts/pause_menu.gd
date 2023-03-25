extends Node2D

var notPaused: bool = true
#var current_scene = null
onready var menu_panel = $menu_panel


func _ready():
	pass
#	var root = get_tree().get_root()
#	current_scene = root.get_child(root.get_child_count() - 1)

func _process(delta):
	if Input.is_action_pressed("pause"):
		if notPaused:
			menu_panel.visible = true
			get_tree().paused = true
			notPaused = false
			
		else:
			pass


func _on_Continue_pressed():
	menu_panel.visible = false
	get_tree().paused = false
	notPaused = true


func _on_Exit_pressed():
	menu_panel.visible = false
	
	var path = "res://assets/main_menu.tscn"
#	 # 1. It is now safe to remove the current scene
#	current_scene.queue_free()
#
#	# 2. Load the new scene.
#	var new_scene = ResourceLoader.load(path)
#
#	# 3. Instance the new scene.
#	current_scene = new_scene.instance()
#
#	# 4. Add it to the active scene, as child of root.
#	get_tree().get_root().add_child(current_scene)
	get_tree().change_scene(path)
	get_tree().paused = false
