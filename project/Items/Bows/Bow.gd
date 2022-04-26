class_name Bow
extends Item

const bow_scene = preload("res://Items/Bows/BowScene.tscn")
const projectile_scene = preload("res://ProjectileScene.tscn")
var bow
var time = 0
export(float) var damage
export(float) var reload_time

func hold_primary(player):
	if time > 0:
		return
	var projectile = projectile_scene.instance()
	projectile.global_position = bow.get_node("Sprite/FirePosition").global_position
	projectile.look_at(projectile.global_position + player.get_global_mouse_position() - player.global_position)
	Globulars.player.get_parent().get_parent().add_child(projectile)
	bow.get_node("AudioStreamPlayer").play()
	time = reload_time

func update(delta):
	# set bow to visible if it is the currently selected item
	bow.visible = Globulars.inventory.find(self) == Globulars.selected_hotbar_slot
	time = max(0, time - delta)

func initialize():
	bow = bow_scene.instance()
	bow.get_node("Sprite").texture = sprite
	Globulars.player.add_child(bow)
