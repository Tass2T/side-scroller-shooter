class_name Bullet extends CharacterBody2D

const SPEED = 150

func _physics_process(delta: float) -> void:
	position.x += SPEED
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
