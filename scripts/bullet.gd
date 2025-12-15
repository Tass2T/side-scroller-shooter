class_name Bullet extends Area2D

var speed: int = 100
var bullet_direction: Vector2
const DAMAGES = 50
var origin_entity: Node2D

func set_target(target: Vector2) -> void:
	bullet_direction = (target - position).normalized()

func _physics_process(_delta: float) -> void:
	position += bullet_direction * speed * _delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body == origin_entity:
		return
		
	if origin_entity is Player && body is Enemy:
		body.get_damaged(50)
	elif origin_entity is Enemy && body is Player:
		body.is_killed()
