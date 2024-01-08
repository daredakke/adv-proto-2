class_name Npc
extends CharacterBody2D

@onready var npc_sprite: Sprite2D = $NpcSprite
@onready var selection_sprite: Sprite2D = $SelectionSprite

@export var npc_texture: Texture2D


func _ready() -> void:
	if npc_texture:
		npc_sprite.texture = npc_texture
	
	anchor_sprite_to_npc_base()
	centre_selection_sprite_on_npc()
	
	selection_sprite.hide()


func anchor_sprite_to_npc_base() -> void:
	var sprite_height: float = npc_sprite.get_rect().size.y
	var npc_height: float = abs(npc_sprite.position.y * 2)
	var new_sprite_y_position: float = (npc_height - sprite_height) * 0.5
	
	npc_sprite.position.y += new_sprite_y_position


func centre_selection_sprite_on_npc() -> void:
	var sprite_top: float = -npc_sprite.get_rect().size.y
	
	selection_sprite.position.y = sprite_top * 0.5
