class_name BulletManager extends Node

@onready var shoot_cooldown: Timer = $ShootCooldown

static var player: Player

var bullet_ressource: PackedScene
var origin_entity
var cooldown: float

var can_shoot: bool = true

func init(_entity, _cooldown: float = 1.0) -> void:
	bullet_ressource = preload("res://scenes/Bullet.tscn")
	origin_entity = _entity
	if _entity is Player:
		player = _entity
	cooldown = _cooldown
	

func shoot() -> void:
	if (!can_shoot):
		return
	can_shoot = false
	#TODO réutiliser les balles sorti, pour les perfs
	var new_bullet: Bullet = bullet_ressource.instantiate()
	if origin_entity is Player:
		new_bullet.position = Vector2(origin_entity.position.x + 40,origin_entity.position.y) 
		new_bullet.set_target(Vector2(get_viewport().get_visible_rect().size.x - origin_entity.position.x + 100, origin_entity.position.y))
	else:
		new_bullet.position = Vector2(origin_entity.position.x,origin_entity.position.y) 
		new_bullet.set_target(player.position) 
	add_child(new_bullet)
	shoot_cooldown.start(cooldown)
	


func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
