extends Node2D

@onready var tilemap: TileMap = get_node("TileMap")
@onready var camera: Camera2D = get_node("Player/Camera2D")
 
func _ready() -> void:
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.tile_set.tile_size
	camera.limit_left = map_rect.position.x * tile_size.x
	camera.limit_right = map_rect.end.x * tile_size.x
	camera.limit_top = map_rect.position.y * tile_size.y
	camera.limit_bottom = map_rect.end.y * tile_size.y


func _on_player_shoot(Bullet: PackedScene, _position: Vector2, _direction: Vector2) -> void:
	var new_bullet = Bullet.instantiate()
	add_child(new_bullet)
	new_bullet.call_deferred("start", _position, _direction)
