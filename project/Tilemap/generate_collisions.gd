tool
extends TileMap

export (int) var counter = 0
export (bool) var generate_autottle_collision = false

var tile_size = 16
var sprite_sheet_size = Vector2(6, 3)

func _ready():
	if Engine.editor_hint:
		#_generate_autotile_collision( )
		#display_numbers()
		_generate_light_occluders()

func display_numbers():
	for i in tile_set.get_tiles_ids():
		print(str(i) + ": " + tile_set.tile_get_name(i))
		
func _generate_autotile_collision( ):
	for j in range(0, 15):
		print(tile_set.tile_get_name(j))
		for i in range(15):
			for _x in range(4):
				for _y in range(2):
					var y = i*2 + _y
					var x = 4 + _x
					var shape = ConvexPolygonShape2D.new()
					if (_x == 1 and _y == 1) or (_x == 2 and _y == 1) or (_x == 3 and _y == 1):
						continue
					shape.points = [Vector2(0,0), Vector2(0, tile_size), Vector2(tile_size, tile_size), Vector2(tile_size, 0)]
					tile_set.tile_add_shape(j,
						shape,
						Transform2D(0.0, Vector2(0,0)),
						false,
						Vector2(x,y))
					#tile_set.tile_set_light_occluder()
					#tile_set.tile_get_light_occluder()
func _generate_light_occluders():
	var base_tile = tile_set.find_tile_by_name("wstone")
	#var base_occ = tile_set.tile_get_light_occluder(base_tile)
	var base_occ = []
	base_occ.resize(3)
	print("base occ len: ", len(base_occ))
	for i in len(base_occ):
		base_occ[i] = []
		base_occ[i].resize(7)
	
	print("-------------------")
	
	for x in range(0, 2):
		for y in range(0, 6):
			for id in tile_set.get_tiles_ids():
				var region = tile_set.tile_get_region(id)
				var index = region.position / region.size;
				var base_index = Vector2(index.x, index.y)
				if base_index == Vector2(x, y):
					print("base_index 1: ", x, y)
					base_occ[base_index.x][base_index.y] = tile_set.tile_get_light_occluder(id)
					break
	
	print("=============================")

	for id in tile_set.get_tiles_ids():
		var region = tile_set.tile_get_region(id)
		var index = region.position / region.size;
		var base_index = Vector2(int(index.x) % 3, int(index.y) % 7)
		tile_set.tile_set_light_occluder(id, base_occ[base_index.x][base_index.y])
		print("occluder: ", base_occ[base_index.x][base_index.y])
		

