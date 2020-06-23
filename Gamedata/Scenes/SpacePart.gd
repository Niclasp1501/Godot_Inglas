extends Area2D

func _on_SpacePart_body_entered(body):
	if "Ingmar" in body.name:
			queue_free()
			
	if "Ingmarl2" in body.name:
			print("hi")
			#queue_free()
