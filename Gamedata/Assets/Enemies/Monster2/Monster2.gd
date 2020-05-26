extends KinematicBody2D

const GRAVTIY = 10
const SPEED = 40
const FLOOR = Vector2(0,-1)

var velocity = Vector2()
var direction = 1


func _ready():
	pass

func _physics_process(delta):
	velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimationPlayer.play("Run")
	

	
	velocity.y += GRAVTIY	 
	velocity = move_and_slide(velocity, FLOOR)
	
	
	if is_on_wall():
		direction = direction *-1
		
