extends Sprite

const SPEED = 200
var velocity = Vector2()
var direction = 1



func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
