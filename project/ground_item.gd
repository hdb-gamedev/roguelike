extends Node2D

export(Resource) var item

func _ready():
	#item = load("res://Items/Polearms/halibutberd.tres")
	#print("load: ", load("res://Items/Polearms/halibutberd.tres").name)
	#print("ready: ", item.properties.size())
	$Sprite.texture = item.sprite
	

func _on_Area2D_area_entered(area):
	Globulars.add_item(item)
	Globulars.inventory[Globulars.inventory.size() - 1].initialize()
	queue_free()
