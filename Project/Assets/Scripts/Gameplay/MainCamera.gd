extends Camera2D

#Works cited
#https://youtu.be/QH5YtfVq6g0

@export var tilemap: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
