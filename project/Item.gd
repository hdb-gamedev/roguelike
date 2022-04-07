extends Resource
class_name Item

enum Rarity {
	COMMON,
	UNCOMMON,
	RARE,
	EPIC,
	LEGENDARY
}

export(String) var name 
export(String) var description
export(Rarity) var rarity
export(Texture) var sprite
export(Dictionary) var properties
var count = 1

func use_primary(player):
	pass
func use_secondary(player):
	pass
func hold_primary(player):
	pass
func hold_secondary(player):
	pass
func update(delta):
	pass
func initialize():
	pass
