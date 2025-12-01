class_name Bullet extends Area2D

const SPEED = 150
const DAMAGES = 50


func _physics_process(_delta: float) -> void:
	position.x += SPEED

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.get_damaged(DAMAGES)
		queue_free()
