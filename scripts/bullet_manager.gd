class_name BulletManager extends Node

@onready var player: Player = $".."
@onready var shoot_cooldown: Timer = $ShootCooldown

var bulletRessource: PackedScene

const SHOOT_COOLDDOWN: float = 0.1
var canShoot: bool = true

func _init() -> void:
	bulletRessource = preload("res://scenes/player/bullet.tscn")
	

func shoot() -> void:
	if (!canShoot):
		return
	canShoot = false
	#TODO réutiliser les balles sorti, pour les perfs
	var newBullet = bulletRessource.instantiate()
	newBullet.position = player.position
	add_child(newBullet)
	shoot_cooldown.start(SHOOT_COOLDDOWN)
	


func _on_shoot_cooldown_timeout() -> void:
	canShoot = true
