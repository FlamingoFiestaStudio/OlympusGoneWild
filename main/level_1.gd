extends Node2D

@export var enemy_buffer_spawn = 30

@onready var tilemap: TileMap = get_node("TileMap")
@onready var camera: Camera2D = get_node("Player/Camera2D")
@onready var enemy_scene: PackedScene = preload("res://enemies/Enemy.tscn")
@onready var tile_set: TileSet
 
func _ready() -> void:
	tile_set = tilemap.tile_set
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.tile_set.tile_size
	camera.limit_left = map_rect.position.x * tile_size.x
	camera.limit_right = map_rect.end.x * tile_size.x
	camera.limit_top = map_rect.position.y * tile_size.y
	camera.limit_bottom = map_rect.end.y * tile_size.y

func _on_enemy_spawner_timer_timeout() -> void:
	var enemy_instance = enemy_scene.instantiate()
	var tile_size = tile_set.tile_size
	var map_rect = tilemap.get_used_rect()
	var spawn_area_x = (map_rect.size.x * tile_size.x) / 2 + enemy_buffer_spawn
	var spawn_area_y = (map_rect.size.y * tile_size.y) / 2 + enemy_buffer_spawn
	var possible_spawn_x = [spawn_area_x, -spawn_area_x]
	var possible_spawn_y = [spawn_area_y, -spawn_area_y]
	
	var random_x = 0
	var random_y = 0
	if randf() < 0.5:
		random_x = randf_range(spawn_area_x, -spawn_area_x)
		random_y = possible_spawn_y.pick_random()
	else:
		random_y = randf_range(spawn_area_y, -spawn_area_y)
		random_x = possible_spawn_x.pick_random()

	enemy_instance.position = Vector2(random_x, random_y)
	add_child(enemy_instance)

func _on_player_shoot(Bullet: PackedScene, _position: Vector2, _direction: Vector2) -> void:
	var new_bullet = Bullet.instantiate()
	add_child(new_bullet)
	new_bullet.call_deferred("start", _position, _direction)
