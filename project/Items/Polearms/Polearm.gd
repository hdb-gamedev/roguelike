class_name Polearm
extends Item

const polearm_scene = preload("res://Items/Polearms/PolearmScene.tscn")
var cooldown = 0;
var polearm
export(float) var damage

func use_primary(player):
	if cooldown > 0:
		pass
	polearm.visible = true
	polearm.get_node("AnimationPlayer").play("Polearm")
	polearm.get_node("Node2D/Area2D").collision_layer = 2
	polearm.get_node("AudioStreamPlayer").play()
	
func hold_primary(player):
	pass
	
func use_secondary(player):
	pass

func hold_secondary(player):
	pass
func update(delta):
	cooldown = max(cooldown - delta, 0)
func initialize():
	polearm = polearm_scene.instance()
	polearm.visible = false
	polearm.item = self
	polearm.get_node("Node2D/Sprite").texture = sprite
	polearm.get_node("Node2D/Area2D").collision_layer = 0
	Globulars.player.add_child(polearm)
