extends Area2D

const SPEED = 200
const SPEED2 = 250
var velocity = Vector2()
var direction = 1

func _ready():
	pass # Replace with function body.
	
func set_stone_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true 
		
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	
	translate(velocity)
	$AnimatedSprite.play("Stone")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Stone_body_entered(body):
	if "Monster" in body.name:
		body.dead()
	queue_free()
	

	
