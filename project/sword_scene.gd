extends Node2D

func _ready():
	pass

func _on_Area2D_area_entered(area):
	print("sword entered")
	queue_free()
