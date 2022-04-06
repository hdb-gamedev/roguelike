class_name Polearm
extends Item

const polearm_scene = preload("res://Items/PolearmScene.tscn")

func use_primary(player):
	var polearm = polearm_scene.instance()
	player.add_child(polearm)
func hold_primary(player):
	print("sword primary button held")
func use_secondary(player):
	print("sword secondary button")
func hold_secondary(player):
	print("sword secondary button held")
