extends Node2D

# cough https://github.com/vazgriz/DungeonGenerator/tree/master/Assets/Scripts2D

var rng: RandomNumberGenerator

var world_size := Vector2(128, 128)

const Player = preload("res://Enemies/Player.gd")

onready var wall_map: TileMap = $YSort/Wall
onready var floor_map: TileMap = $YSort/Floor
onready var player: Player = $YSort/Player
onready var button: Button = $CanvasLayer/HBoxContainer/ClickMe

var RoomTypes = [
	preload("res://Worldgen/RoomTypes/RoomInstance.gd"),
	preload("res://Worldgen/RoomTypes/GreenRoom.gd")
]

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	wall_map.clear()
	floor_map.clear()
	
	#player.position = world_size / 2
	player.position = Vector2.ZERO
#	debug_rect(Rect2(Vector2.ZERO, world_size))
#	debug_rect(Rect2(Vector2.ZERO, Vector2.ONE))
	
	place_rooms()

var debug_rect_rng := RandomNumberGenerator.new()

func debug_rect(rect: Rect2) -> ColorRect:
	var color_rect := ColorRect.new()
	color_rect.margin_left = rect.position.x * wall_map.cell_size.x
	color_rect.margin_top = rect.position.y * wall_map.cell_size.y
	color_rect.margin_right = rect.end.x * wall_map.cell_size.x
	color_rect.margin_bottom = rect.end.y * wall_map.cell_size.y
	color_rect.color = Color(debug_rect_rng.randf(), debug_rect_rng.randf(), debug_rect_rng.randf(), 0.5)
	add_child_below_node(player, color_rect)
	return color_rect
	

func get_room_instance() -> RoomInstance:
	return RoomInstance.new()

func place_rooms():
	var room_max_count := 250
	
	var max_room_size := Vector2(8, 8)
	
	var rooms := []
	
	for i in room_max_count:
		var room_instance := get_room_instance()
		
		var location := Vector2(
			rng.randi_range(0, world_size.x),
			rng.randi_range(0, world_size.y)
		)
		
		var size := Vector2(
			rng.randi_range(room_instance.min_size.x, room_instance.max_size.x),
			rng.randi_range(room_instance.min_size.y, room_instance.max_size.y)
		)
		
		var add := true
		room_instance.rect = Rect2(location, size)
		var buffer := room_instance.rect.grow(2)
		
		var room_debug := debug_rect(room_instance.rect)
		var buffer_debug := debug_rect(buffer)
		
		# yield(button, "button_down")
		
		for other_room in rooms:
			if buffer.intersects(other_room):
				add = false
				break
		
		if not Rect2(Vector2(), world_size).encloses(room_instance.rect):
			add = false
			
		
		print("" if add else "not ", "adding")
		
		if add:
			rooms.append(room_instance.rect)
			room_instance.place(floor_map, wall_map)
			
		# yield(button, "button_down")
		
		room_debug.queue_free()
		buffer_debug.queue_free()
	print("success rate: ", float(len(rooms)) / room_max_count)
	
	floor_map.update_bitmask_region()
	wall_map.update_bitmask_region()


func _on_ToggleZoom_button_down():
	var camera: Camera2D = $YSort/Player/Camera2D
	if camera.zoom.x == 0.25:
		camera.zoom = 2 * Vector2.ONE
	else:
		camera.zoom = 0.25 * Vector2.ONE
