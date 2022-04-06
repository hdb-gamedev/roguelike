tool
extends TileSet

var template
var tile_size = 16

# becasue i couldn't get export vars to work
var spacings = {
	'Wall': Vector2(112, 48),
	'Floor': Vector2(112, 48),
	'Pit': Vector2(0, 32),
}

var howmany = {
	'Wall': Vector2(3, 16),
	'Floor': Vector2(3, 16),
	'Pit': Vector2(1, 15),
}

func _init():
	var name = resource_path.get_file().trim_suffix('.tres')
	
	if not name:
		return
	
	print("doing tilemap " + name)
	
	template = find_tile_by_name("template")
	
	if template == -1:
		print("please name the template 'template'")
		return
		
	var spacing = spacings[name]
	
	reset()
	
	var i = 1
	
	for x in range(howmany[name].x):
		for y in range(howmany[name].y):
			make_tile(spacing * Vector2(x, y+1), name + str(i))
			i += 1
	
func reset():
	for id in get_tiles_ids():
		if id != template:
			remove_tile(id)

func make_tile(offset, name):
	var id = get_last_unused_tile_id()
	create_tile(id)
	tile_set_name(id, name)
	
	tile_set_texture(id, tile_get_texture(template))
	
	var template_region = tile_get_region(template)
	tile_set_region(id, Rect2(template_region.position + offset, template_region.size))
	
	tile_set_tile_mode(id, AUTO_TILE)
	autotile_set_size(id, autotile_get_size(template))
	autotile_set_spacing(id, autotile_get_spacing(template))
	autotile_set_bitmask_mode(id, autotile_get_bitmask_mode(template))
	
	var shapes = {}
	for info in tile_get_shapes(template):
		shapes[info["autotile_coord"]] = info
	
	var num_autotiles = tile_get_region(template).size / autotile_get_size(template)
	for x in range(num_autotiles.x):
		for y in range(num_autotiles.y):
			var coord = Vector2(x, y)
			
			autotile_set_bitmask(id, coord, autotile_get_bitmask(template, coord))
			autotile_set_subtile_priority(id, coord, autotile_get_subtile_priority(template, coord))
			autotile_set_z_index(id, coord, autotile_get_z_index(template, coord))
			
			if coord in shapes:
				tile_add_shape(id, shapes[coord]["shape"], shapes[coord]["shape_transform"], shapes[coord]["one_way"], coord)
				
			autotile_set_light_occluder(id, autotile_get_light_occluder(template, coord), coord)
