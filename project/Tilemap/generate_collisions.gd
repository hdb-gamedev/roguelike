tool
extends TileMap

export (int) var counter = 0
export (bool) var generate_autottle_collision = false

var tile_size = 16
var sprite_sheet_size = Vector2(6, 3)

func _ready():
	if Engine.editor_hint:
		_generate_autotile_collision( )
		
func _generate_autotile_collision( ):
	for j in range(23, 24):
		print(tile_set.tile_get_name(j))
		for i in range(4):
			for _x in range(6):
				for _y in range(3):
					var y = i*3 + _y
					var x = _x
					var shape = ConvexPolygonShape2D.new()
					if (_x == 5 and _y == 0) or (_x == 2 and _y == 1) or (_x == 1 and _y == 2) or (_x == 3 and _y == 2) or (_x == 5 and _y == 2):
						continue
					shape.points = [Vector2(0,0), Vector2(0, tile_size), Vector2(tile_size, tile_size), Vector2(tile_size, 0)]
					tile_set.tile_add_shape(j,
						shape,
						Transform2D(0.0, Vector2(0,0)),
						false,
						Vector2(x,y))
