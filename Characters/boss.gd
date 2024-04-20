extends Node2D
@onready var parent: Character = get_parent()
@onready var animation_player: AnimationPlayer = parent.get_node("AnimationPlayer")
@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation_player.play("idle")
