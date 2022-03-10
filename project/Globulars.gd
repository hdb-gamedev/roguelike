extends Node

var health setget set_health

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

func _ready():
	inventory = []
