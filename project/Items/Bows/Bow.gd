class_name Bow
extends Item

const bow_scene = preload("res://Items/Bows/BowScene.tscn")
const projectile_scene = preload("res://ProjectileScene.tscn")
var bow


func use_primary(player):
	var projectile = projectile_scene.instance()
	projectile.global_position = player.global_position
	projectile.look_at(player.get_global_mouse_position())
	Globulars.player.get_parent().get_parent().add_child(projectile)
	bow.get_node("AudioStreamPlayer").play()
	print("Playing")
func update(delta):
	# set bow to visible if it is the currently selected item
	bow.visible = Globulars.inventory.find(self) == Globulars.selected_hotbar_slot

func initialize():
	bow = bow_scene.instance()
	bow.get_node("Sprite").texture = sprite
	Globulars.player.add_child(bow)
