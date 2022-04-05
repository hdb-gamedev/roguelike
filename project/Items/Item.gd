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
