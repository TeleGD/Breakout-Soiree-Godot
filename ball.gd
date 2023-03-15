extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
signal out_of_bounds()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	set_velocity(Vector2(500,-500))

func _physics_process(delta):
	
	var collisioninfo = move_and_collide(velocity*delta)
	if collisioninfo :
		velocity = velocity.bounce(collisioninfo.get_normal())
		if collisioninfo.get_collider().is_in_group("Brique"):
			collisioninfo.get_collider().queue_free()
		
	if get_position().y > 648 :
		emit_signal("out_of_bounds")
	
