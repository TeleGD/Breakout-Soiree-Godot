extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed = 500
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed('ui_right'):
		direction = 1
	var movement = Vector2(speed*direction*delta, 0)
	set_position(get_position() + movement)
	
	pass
