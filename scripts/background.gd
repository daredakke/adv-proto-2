class_name Background
extends CanvasLayer

@onready var base: Sprite2D = %Base
@onready var middle: Sprite2D = %Middle
@onready var top: Sprite2D = %Top

@export_category("Textures")
@export var base_texture: Texture2D
@export var middle_texture: Texture2D
@export var top_texture: Texture2D

@export_category("TextureSize")
@export var width: int = 2200
@export var height: int = 2200

@export_category("Rotation")
@export_range(-3, 3) var base_rotation: float = 0.05
@export_range(-3, 3) var middle_rotation: float = 0.25
@export_range(-3, 3) var top_rotation: float = -0.25


func _ready() -> void:
	if base_texture:
		base.texture = base_texture
		base.scale = scale_sprite(base, width, height)
		centre_sprite(base)
	
	if middle_texture:
		middle.texture = middle_texture
		middle.scale = scale_sprite(middle, width, height)
		centre_sprite(middle)
	
	if top_texture:
		top.texture = top_texture
		top.scale = scale_sprite(top, width, height)
		centre_sprite(top)


func _process(delta: float) -> void:
	base.rotation_degrees += base_rotation
	middle.rotation_degrees += middle_rotation
	top.rotation_degrees += top_rotation


func set_background_sprite(
		sprite: Sprite2D, 
		texture: Texture2D, 
		width: float, 
		height: float
	) -> void:
	sprite.texture = texture
	sprite.scale = scale_sprite(sprite, width, height)
	centre_sprite(sprite)


func centre_sprite(sprite: Sprite2D) -> void:
	sprite.position.x = get_viewport().size.x * 0.5
	sprite.position.y = get_viewport().size.y * 0.5


func scale_sprite(sprite: Sprite2D, width: float, height: float) -> Vector2:
	var result: Vector2 = Vector2.ZERO
	
	result.x = get_scale_factor(sprite.get_rect().size.x, width)
	result.y = get_scale_factor(sprite.get_rect().size.y, height)
	
	return result


func get_scale_factor(value: float, target: float) -> float:
	return snappedf(target / value, 0.01)
