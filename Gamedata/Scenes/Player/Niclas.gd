extends KinematicBody2D


onready var diabox = get_parent().get_node("DiaInterface/DiaBox_Nic1")

func _ready():
	print(diabox)




func _on_IngmarDetector_body_entered(body):
	print("Starte Dialog")
	print(body.score)
	#diabox.visible= true
	diabox.open(body.score)
	if body.score ==3:
		body.nl =true
	

