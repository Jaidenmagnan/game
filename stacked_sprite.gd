extends Sprite2D

# Backing field + property (Godot 4 style)
@export var _show_sprites: bool = false
var show_sprites: bool:
	get: return _show_sprites
	set(value):
		_show_sprites = value
		if _show_sprites:
			render_sprites()
		else:
			clear_sprites()

@export var rotate_sprites: bool = false

func _ready() -> void:
	render_sprites()

func _process(delta: float) -> void:
	if rotate_sprites:
		for sprite in get_children():
			if sprite is Node2D:
				sprite.rotation += delta

func clear_sprites() -> void:
	for sprite in get_children():
		sprite.queue_free()

func render_sprites() -> void:
	clear_sprites()
	for i in range(hframes):
		var next_sprite := Sprite2D.new()
		next_sprite.texture = texture
		next_sprite.hframes = hframes
		next_sprite.frame = i
		next_sprite.position.y = -i # offset per layer
		add_child(next_sprite)

# Optional helper, if you want to set all children’s rotation at once
func set_children_rotation(angle: float) -> void:
	for sprite in get_children():
		if sprite is Node2D:
			sprite.rotation = angle
