class_name Bullet extends StaticBody2D

const SPEED = 150

func _physics_process(_delta: float) -> void:
	position.x += SPEED


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
