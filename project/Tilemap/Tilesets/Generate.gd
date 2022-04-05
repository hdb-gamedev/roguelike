tool
extends TileSet

var template
var offset
var tile_size = 16

# becasue i couldn't get export vars to work
var offsets = {
	'Wall': Vector2(0, 48)
}

func _init():
	var name = resource_path.get_file().trim_suffix('.tres')
		
	template = find_tile_by_name("template")
	offset = offsets[name]
	
	reset()
	
	make_tile()
	
func reset():
	for id in get_tiles_ids():
		if id != template:
			remove_tile(id)

func make_tile():
	var id = get_last_unused_tile_id()
	create_tile(id)
	
	tile_set_texture(id, tile_get_texture(template))
	
	var template_region = tile_get_region(template)
	tile_set_region(id, Rect2(template_region.position + Vector2(0, offset.y), template_region.size))
	
	tile_set_tile_mode(id, AUTO_TILE)
	autotile_set_size(id, autotile_get_size(template))
	autotile_set_spacing(id, autotile_get_spacing(template))
	autotile_set_bitmask_mode(id, autotile_get_bitmask_mode(template))
	
	var shapes = {}
	for info in tile_get_shapes(template):
		shapes[info["autotile_coord"]] = info
	
	var num_autotiles = tile_get_region(template).size / autotile_get_size(template)
	for i in range(num_autotiles.x):
		for j in range(num_autotiles.y):
			var coord = Vector2(i, j)
			
			autotile_set_bitmask(id, coord, autotile_get_bitmask(template, coord))
			
			if coord in shapes:
				tile_add_shape(id, shapes[coord]["shape"], shapes[coord]["shape_transform"], shapes[coord]["one_way"], coord)
				
			autotile_set_light_occluder(id, autotile_get_light_occluder(template, coord), coord)
