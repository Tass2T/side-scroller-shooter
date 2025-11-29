class_name EnemyManager extends Node

const FILE_PATH: String = "res://enemies_data.json"
const ENEMY_FILEPATH: String = "res://scenes/enemies/Enemy.tscn"
var enemyRessource: PackedScene

var level_enemy_data
var ellapsed_time: float = 0
	
func _init() -> void:
	enemyRessource = preload(ENEMY_FILEPATH)

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
	checkForEnemySpawn()
	
func checkForEnemySpawn() -> void:
	for enemy in level_enemy_data:
		if enemy.time_stamp <= ellapsed_time:
			var new_enemy: Enemy = enemyRessource.instantiate()
			new_enemy.init(enemy.id, enemy.origin, enemy.from, get_viewport())
			level_enemy_data.remove_at(0)
			add_child(new_enemy)
			
			
