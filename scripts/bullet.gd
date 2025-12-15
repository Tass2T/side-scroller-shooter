class_name Bullet extends Area2D

var speed: int = 100
const DAMAGES = 50
var bullet_direction: Vector2

func set_target(target: Vector2) -> void:
	bullet_direction = (target - position).normalized()

func _physics_process(_delta: float) -> void:
	position += bullet_direction * speed * _delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
