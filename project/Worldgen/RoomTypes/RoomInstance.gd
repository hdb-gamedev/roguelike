extends Node
class_name RoomInstance

static var weight := 0.2

var floor_tile_name := "Floor1"
var wall_tile_name := "Wall1"
var rect: Rect2
var min_size := Vector2(4, 4)
var max_size := Vector2(8, 8)

func place(floor_map: TileMap, wall_map: TileMap):
	var floor_tile := floor_map.tile_set.find_tile_by_name(floor_tile_name)
	var wall_tile := wall_map.tile_set.find_tile_by_name(wall_tile_name)
	for i in rect.size.x:
		for j in rect.size.y:
			var pos := Vector2(rect.position.x + i, rect.position.y + j)
			if i == 0 or i == rect.size.x - 1 or j == 0 or j == rect.size.y - 1:
				wall_map.set_cellv(pos, wall_tile)
			else:
				floor_map.set_cellv(pos, floor_tile)
