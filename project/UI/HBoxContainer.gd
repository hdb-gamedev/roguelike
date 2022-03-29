extends HBoxContainer

# MOVE THIS LATER
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
