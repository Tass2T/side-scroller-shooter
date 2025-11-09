class_name Player extends CharacterBody2D

@onready var bullet_manager: BulletManager = $BulletManager

func _physics_process(delta: float) -> void:
	position = get_viewport().get_mouse_position()
	
	if Input.is_action_pressed("shoot"):
		bullet_manager.shoot()
