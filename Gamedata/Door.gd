extends Node2D


func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "Ingmar" in body.name and body.score==3:
		get_tree().change_scene("res://Scenes/Game2.tscn")

