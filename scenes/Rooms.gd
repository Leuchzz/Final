extends Node2D

const SPAWN_ROOMS: Array = [preload("res://Rooms/spawnroom.tscn")]
const INTERMEDIATE_ROOMS: Array = [preload("res://Rooms/room0.tscn"), preload("res://Rooms/room1.tscn")]
const END_ROOMS: Array = [preload("res://Rooms/endroom.tscn")]

const TILE_SIZE: int = 10	
const FLOOR_TILE_INDEX: int = 10
const RIGHT_WALL_TILE_INDEX: int = 3
const LEFT_WALL_TILE_INDEX: int = 4


@export var num_levels: int = 3



@onready var player: CharacterBody2D = get_parent().get_node("Player")
