extends Node2D

const GRAVTIY = 10
const SPEED = 30
const FLOOR = Vector2(0,-1)

var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity.x = SPEED
	$AnimationPlayer.play("run")



 
