class_name Sword
extends Item

export(float) var damage
export(float) var swing_speed
const sword_scene = preload("res://Items/Swords/SwordScene.tscn")
var sword

func initialize():
	sword = sword_scene.instance()
	sword.rotation_speed = swing_speed
	sword.visible = false
	sword.get_node("Sprite").texture = sprite
	Globulars.player.add_child(sword)

func use_primary(player):
	if !sword.swinging:
		sword.start_swing()
