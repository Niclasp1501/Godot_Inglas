extends Area2D

func _on_SpacePart_body_entered(body):
	if "Ingmar" in body.name:
			queue_free()
