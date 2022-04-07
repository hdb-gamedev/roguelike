extends HBoxContainer
onready var player = Globulars.player


func _process(delta):
	if Input.is_action_just_pressed("hotbar_1"):
		Globulars.selected_hotbar_slot = 0
	elif Input.is_action_just_pressed("hotbar_2"):
		Globulars.selected_hotbar_slot = 1
	elif Input.is_action_just_pressed("hotbar_3"):
		Globulars.selected_hotbar_slot = 2
	elif Input.is_action_just_pressed("hotbar_4"):
		Globulars.selected_hotbar_slot = 3
	elif Input.is_action_just_pressed("hotbar_5"):
		Globulars.selected_hotbar_slot = 4
	elif Input.is_action_just_pressed("hotbar_6"):
		Globulars.selected_hotbar_slot = 5
	elif Input.is_action_just_pressed("hotbar_7"):
		Globulars.selected_hotbar_slot = 6
	if Globulars.selected_hotbar_slot < Globulars.inventory.size():
		if Input.is_action_just_pressed("primary_item"):
			Globulars.inventory[Globulars.selected_hotbar_slot].use_primary(player)
		elif Input.is_action_pressed("primary_item"):
			Globulars.inventory[Globulars.selected_hotbar_slot].hold_primary(player)
		if Input.is_action_just_pressed("secondary_item"):
			Globulars.inventory[Globulars.selected_hotbar_slot].use_secondary(player)
		elif Input.is_action_pressed("secondary_item"):
			Globulars.inventory[Globulars.selected_hotbar_slot].hold_secondary(player)
	for i in range(min(Globulars.inventory.size(), 7)):
		Globulars.inventory[i].update(delta)
