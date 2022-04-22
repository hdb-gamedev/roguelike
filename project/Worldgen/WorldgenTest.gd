extends Node2D

# cough https://github.com/vazgriz/DungeonGenerator/tree/master/Assets/Scripts2D

var rng: RandomNumberGenerator

var world_size := Vector2(32, 32)

const Player = preload("res://Enemies/Player.gd")

onready var wall_map: TileMap = $Wall
onready var floor_map: TileMap = $Floor
onready var player: Player = $Player
onready var button: Button = $CanvasLayer/HBoxContainer/ClickMe

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	wall_map.clear()
	floor_map.clear()
	
	#player.position = world_size / 2
	player.position = Vector2.ZERO
	debug_rect(Rect2(Vector2.ZERO, world_size))
	debug_rect(Rect2(Vector2.ZERO, Vector2.ONE))
	
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
	
	
func debug_rect_and_wait(rect: Rect2):
	var color_rect := debug_rect(rect)
	
	yield(button, "button_down")
	
	color_rect.queue_free()
	
func place_rooms():
	var splitted := split_space()
	
	for section in splitted:
		if true:
			var room: Rect2 = section.grow(-1)
			place_room(room)
		

func split_space() -> Array:
	var min_room_size := 6
	
	var queue := [Rect2(Vector2.ZERO, world_size)]
	var rooms := []
	
	while queue:
		var room: Rect2 = queue.pop_front()
		
		var is_vertical := rng.randf() > 0.5
		
		if is_vertical:
			room = swap_rect_coordinates(room)
		
		if room.size.x <= min_room_size * 2:
			is_vertical = not is_vertical
			room = swap_rect_coordinates(room)
		if room.size.x > min_room_size * 2:	
			var split := rng.randi_range(min_room_size + 4, room.size.x - min_room_size - 4)

			var left := Rect2(room.position, Vector2(split, room.size.y))
			var right := Rect2(room.position + split * Vector2.RIGHT, Vector2(room.size.x - split, room.size.y))
			
			if is_vertical:
				left = swap_rect_coordinates(left)
				right = swap_rect_coordinates(right)
			
			queue.append(left)
			queue.append(right)
	
		else:
			if is_vertical:
				room = swap_rect_coordinates(room)	
			
			rooms.append(room)
	return rooms

func place_room(room: Rect2):
	var floor_tile := floor_map.tile_set.find_tile_by_name("Floor1")
	for i in room.size.x:
		for j in room.size.y:
			var pos := Vector2(room.position.x + i, room.position.y + j)
			floor_map.set_cellv(pos, floor_tile)
	floor_map.update_bitmask_region()


func _on_ToggleZoom_button_down():
	var camera: Camera2D = $Player/Camera2D
	if camera.zoom.x == 0.25:
		camera.zoom = 2 * Vector2.ONE
	else:
		camera.zoom = 0.25 * Vector2.ONE

func swap_rect_coordinates(rect: Rect2) -> Rect2:
	return Rect2(
		Vector2(rect.position.y, rect.position.x),
		Vector2(rect.size.y, rect.size.x)
	)
