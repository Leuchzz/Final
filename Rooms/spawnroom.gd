extends Node2D
class_name DungeonRoom

const SPAWN_EXPLOSION_SCENE: PackedScene = preload("res://Rooms/spawn_explosion.tscn")
const ENEMY_SCENES: Dictionary = {
	"SLIME": preload("res://Characters/Enemy/Slime/slimeenemy.tscn")
}

var num_enemies: int

@onready var tilemap: TileMap = get_node("TileMap2")
@onready var entrance: Node2D = get_node("Entrance")
@onready var door_container: Node2D = get_node("Doors")
@onready var enemy_positions_container: Node2D = get_node("EnemyPositions")
@onready var player_detector: Area2D = get_node("PlayerDetector")

func _ready() -> void:
	num_enemies = enemy_positions_container.get_child_count()


func _on_enemy_killed() -> void:
	num_enemies -= 1
	if num_enemies == 0:
		_open_doors()


func _open_doors() -> void:
	for door in door_container.get_children():
		door.open()
		
		
func _close_entrance() -> void:
	for entry_position in entrance.get_children():
		print(tilemap.local_to_map(entry_position.position))
		tilemap.set_cell(0, tilemap.local_to_map(entry_position.position), 0, Vector2i.ZERO)
		tilemap.set_cell(4, tilemap.local_to_map(entry_position.position) + Vector2i.DOWN, 2, Vector2i.ZERO)


func _spawn_enemies() -> void:
	for enemy_position in enemy_positions_container.get_children():
		var enemy: CharacterBody2D = ENEMY_SCENES.SLIME.instantiate()
		enemy.position = enemy_position.position
		call_deferred("add_child", enemy)


		var spawn_explosion: AnimatedSprite2D = SPAWN_EXPLOSION_SCENE.instantiate()
		spawn_explosion.position = enemy_position.position
		call_deferred("add_child", spawn_explosion)
		






func _on_player_detector_body_entered(body):
	player_detector.queue_free()
	if num_enemies > 0:
		_close_entrance()
		_spawn_enemies()
	else:
		_close_entrance()
		_open_doors()
		
var entered=false

func _on_area_2d_body_entered(body):
	entered=false


func _on_area_2d_body_exited(body):
	entered=true
	
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_up"):
			get_tree().change_scene_to_file("res://Rooms/room0.tscn")
