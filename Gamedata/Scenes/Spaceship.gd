extends Sprite

const SPEED = 200
var velocity = Vector2()
var direction = 1



func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	
func RocketStart():
	$AnimationPlayer.play("RocketStart")
	$Timer.start(2)


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Menu_YouWin/Menu_YouWin.tscn")
