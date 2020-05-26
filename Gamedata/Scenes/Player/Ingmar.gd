extends KinematicBody2D


const SPEED = 100
const GRAVITY = 10
const JUMP_POWER = -400
const FLOOR = Vector2(0,-1)

const STONE = preload("res://Assets/Weapon/Stone/Stone.tscn")


var velocity = Vector2()

var on_ground = false


func _physics_process(delta):
		
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			#$AnimatedSprite.play("RunRight")
			$AnimationPlayer.play("RunRight")
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED 
			#$AnimatedSprite.play("RunLeft")
			$AnimationPlayer.play("RunLeft")
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			velocity.x = 0	
			#$AnimatedSprite.play("Idle")
			$AnimationPlayer.play("Idle")
			
		if Input.is_action_pressed("ui_up"):
			if on_ground == true:
				velocity.y = JUMP_POWER
				on_ground = false
				
		if Input.is_action_just_pressed("Use"):
			
			var stone = STONE.instance()
			if sign($Position2D.position.x) == 1:
				stone.set_stone_direction(1)
			else:
				stone.set_stone_direction(-1)
			get_parent().add_child(stone)
			stone.position = $Position2D.global_position
		
		velocity.y = velocity.y + GRAVITY
		
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
			
		velocity = move_and_slide(velocity, FLOOR)
