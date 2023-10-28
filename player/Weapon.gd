extends Marker2D

signal shoot

@export var Bullet: PackedScene

@onready var weapon: Marker2D = get_node(".")
@onready var direction: Marker2D = get_node("Direction")
@onready var timer: Timer = get_node("Timer")

var can_shoot: bool = true

func _process(delta) -> void:
	weapon.look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("shoot"):
		_shoot()
	
func _shoot() -> void:
	if can_shoot:
		can_shoot = false
		timer.start()
		var direction = Vector2(1,0).rotated(weapon.global_rotation)
		emit_signal("shoot", Bullet, weapon.global_position, direction)

func _on_timer_timeout() -> void:
	can_shoot = true
