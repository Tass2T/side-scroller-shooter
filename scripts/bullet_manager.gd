class_name BulletManager extends Node

@onready var shoot_cooldown: Timer = $ShootCooldown

const SHOOT_COOLDDOWN: float = 0.4 

var canShoot: bool = true

func shoot() -> void:
	if (!canShoot):
		return
	canShoot = false
	
	shoot_cooldown.start(SHOOT_COOLDDOWN)
	


func _on_shoot_cooldown_timeout() -> void:
	canShoot = true
