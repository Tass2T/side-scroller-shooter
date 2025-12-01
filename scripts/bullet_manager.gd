class_name BulletManager extends Node

@onready var shoot_cooldown: Timer = $ShootCooldown

var bullet_ressource: PackedScene
var origin_entity
var cooldown: float = 1.0

var can_shoot: bool = true

func init(_entity, _cooldown: float) -> void:
	bullet_ressource = preload("res://scenes/Bullet.tscn")
	origin_entity = _entity
	cooldown = _cooldown
	

func shoot() -> void:
	if (!can_shoot):
		return
	can_shoot = false
	#TODO réutiliser les balles sorti, pour les perfs
	var new_bullet = bullet_ressource.instantiate()
	new_bullet.position = Vector2(origin_entity.position.x + 40,origin_entity.position.y) 
	add_child(new_bullet)
	shoot_cooldown.start(cooldown)
	


func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
