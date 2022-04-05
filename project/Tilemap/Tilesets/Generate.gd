tool
extends TileSet

var template
#export(Vector2) var offset
var offset = Vector2(0, 48)

func _init():
	print("hello from the tile set")
	print("offset is " + str(offset))
	
	template = find_tile_by_name("template")
	
	for id in get_tiles_ids():
		if id != template:
			remove_tile(id)
	
	print(tile_get_region(template))
	
	make_tile()
	print(get_tiles_ids())

func make_tile():
	var id = get_last_unused_tile_id()
	create_tile(id)
	tile_set_texture(id, tile_get_texture(template))
	var template_region = tile_get_region(template)
	tile_set_region(id, Rect2(template_region.position + Vector2(0, offset.y), template_region.size))
	
	autotile_set_size(id, autotile_get_size(template))
	autotile_set_spacing(id, autotile_get_spacing(template))
	
	var num_autotiles = tile_get_region(template).size / autotile_get_size(template)
	
	for i in range(num_autotiles.x):
		for j in range(num_autotiles.y):
			var coord = Vector2(i, j)
			autotile_set_bitmask(id, coord, autotile_get_bitmask(id, coord))
