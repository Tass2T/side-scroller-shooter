class_name Enemy extends CharacterBody2D

enum States {ENTERING, SHOOTING, LEAVING}

const ENEMY_SPEED: float = 1000
const TIMER_BEFORE_LEAVING: float = 10.0

var id: float
var origin: String
var start_pos: Vector2
var tween: Tween
var HP: int = 50

var state = States.ENTERING

func init(_id: float, _origin: String, _from: float, _viewport: Viewport) -> void:
	id = _id
	origin = _origin
	
	if origin == "TOP":
		start_pos = Vector2((_viewport.get_visible_rect().size.x / 100) * _from, - 1)
	elif origin == "BOTTOM":
		start_pos = Vector2((_viewport.get_visible_rect().size.x / 100) * _from, _viewport.get_visible_rect().size.y + 1)
	else:
		start_pos = Vector2(_viewport.get_visible_rect().size.x + 1, (_viewport.get_visible_rect().size.y / 100) * _from)
	position = start_pos
	
func _process(delta: float) -> void:
	if HP <= 0:
		Exit()
	
	
func _physics_process(delta: float) -> void:
	var viewPortSize = get_viewport().get_visible_rect().size
	if state == States.ENTERING:
		match origin:
			"TOP":
				if position.y < viewPortSize.y * 0.3:
					position.y += ENEMY_SPEED * delta
				else: state = States.SHOOTING
			"BOTTOM":
				if position.y > viewPortSize.y * 0.7:
					position.y -= ENEMY_SPEED * delta
				else: state = States.SHOOTING
			_:
				if position.x > viewPortSize.x * 0.7:
					position.x -= ENEMY_SPEED * delta
				else: state = States.SHOOTING
					
	elif state == States.SHOOTING:
		startShooting()
		
func get_damaged(amount: int) -> void:
	HP -= amount
	
func startShooting() -> void:
	pass
	
func Exit() -> void:
	queue_free()
