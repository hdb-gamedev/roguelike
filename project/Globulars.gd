extends Node

var health setget set_health

var player

func set_health(h):
	health = h
	emit_signal("health_changed", h)
	
signal health_changed(health)

var max_health setget set_max_health

func set_max_health(h):
	max_health = h
	emit_signal("max_health_changed", h)
	
signal max_health_changed(max_health)

var inventory
var selected_hotbar_slot = 1
func _ready():
	inventory = []
	
func add_item(item):
	for item_stack in inventory:
		if item_stack.name == item.name:
			item_stack.count += item.count
			return
	inventory.append(item)
	#print(item.propertie1s.size())

