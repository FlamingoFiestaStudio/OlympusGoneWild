extends Node2D

@export var tilemap: TileMap
@onready var camera: Camera2D = get_node("Player/Camera2D")
 
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.tile_set.tile_size
	camera.limit_left = mapRect.position.x * tileSize.x
	camera.limit_right = mapRect.end.x * tileSize.x
	camera.limit_top = mapRect.position.y * tileSize.y
	camera.limit_bottom = mapRect.end.y * tileSize.y
	
