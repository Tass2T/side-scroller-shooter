class_name Enemy extends Node

var id: float
var start_pos: Vector2
var destination: Vector2
var last_pos: Vector2

func init(_id: float, _start_pos, _destination, _last_pos) -> void:
	id = _id
	start_pos = Vector2(_start_pos[0], _start_pos[1])
	destination = Vector2(_destination[0], _destination[1])
	last_pos = Vector2(_last_pos[0], _last_pos[1]) 
