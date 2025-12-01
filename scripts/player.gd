class_name Player extends CharacterBody2D

@onready var bullet_manager: BulletManager = $BulletManager
@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	bullet_manager.init(self, 0.1)


func _physics_process(_delta: float) -> void:
	
	manage_position()
	
	if Input.is_action_pressed("shoot"):
		bullet_manager.shoot()


func manage_position() -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	var window_size: Vector2 = get_viewport_rect().size

	if mouse_position.y > window_size.y:
		mouse_position.y = window_size.y 
	elif mouse_position.y < 0:
		mouse_position.y = 0 
		
	if mouse_position.x - color_rect.size.x / 2 < 0:
		mouse_position.x = 0 + color_rect.size.x / 2
	elif mouse_position.x + color_rect.size.x / 2 > window_size.x:
		mouse_position.x = window_size.x - color_rect.size.x / 2
		
	position = mouse_position
