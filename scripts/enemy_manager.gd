class_name EnemyManager extends Node

var FILE_PATH: String = "res://enemies_data.json"
var level_enemy_data
var ellapsed_time: float = 0

func _ready() -> void:
	loadEnemiesData()

func loadEnemiesData() -> void:
	var currentLevel: String = get_parent().level
	var file := FileAccess.open(FILE_PATH, FileAccess.READ)
	var file_as_json: Dictionary = JSON.parse_string(file.get_as_text())
	file.close()
	level_enemy_data = file_as_json[currentLevel]

func _process(delta: float) -> void:
	ellapsed_time += delta
	
