extends Node2D

@export var tilemap: TileMap
@onready var camera: Camera2D = get_node("Player/Camera2D")
 
func _ready():
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.tile_set.tile_size
	camera.limit_left = map_rect.position.x * tile_size.x
	camera.limit_right = map_rect.end.x * tile_size.x
	camera.limit_top = map_rect.position.y * tile_size.y
	camera.limit_bottom = map_rect.end.y * tile_size.y
	
