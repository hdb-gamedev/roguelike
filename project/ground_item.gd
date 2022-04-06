extends Node2D

export(Resource) var item

func _ready():
	$Sprite.texture = item.sprite

func _on_Area2D_area_entered(area):
	Globulars.add_item(item)
	queue_free()
