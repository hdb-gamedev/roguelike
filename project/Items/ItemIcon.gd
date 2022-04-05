extends TextureRect
export(int) var index

func _process(delta):
	if Globulars.inventory.size() > index:
		$ItemTexture.texture = Globulars.inventory[index].sprite
	$MarginContainer/HighlightBackground.visible = Globulars.selected_hotbar_slot == index
