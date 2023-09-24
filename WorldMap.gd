extends Node2D

const Character = preload("res://Character.tscn")

var begin_character : Character
var draging_curve : Curve2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var prev_prog = $Path2D/PathFollow2D.progress_ratio
	prev_prog += delta * 2
	prev_prog = 0 if prev_prog > 1 else prev_prog
	$Path2D/PathFollow2D.progress_ratio = prev_prog
	
func _character_mousedown(_viewport:Node, event:InputEvent, _shape_idx:int, character:Character):
	if event.is_action_pressed("drag"):
		begin_character = character
		draging_curve = Curve2D.new()
		draging_curve.clear_points()
		draging_curve.add_point(character.position)
		
	elif event.is_action_released("drag") and begin_character != character:
		draging_curve.add_point(character.position,
								Vector2(begin_character.position.x - character.position.x, 0))
		$Path2D.curve = draging_curve
		$Path2D/PathFollow2D.progress_ratio = 0
		$Path2D.visible = true

func _unhandled_key_input(event):
	if event.is_action_pressed("new"):
		var c = Character.instantiate()
		c.input_event.connect(_character_mousedown.bind(c))
		c.translate(Vector2(randi_range(0, get_viewport_rect().size.x),
							randi_range(0, get_viewport_rect().size.y)))
		c.visible = true
		$CharacterCanvasLayer.add_child(c)
		print("new=", c)
	elif event.is_action_pressed("clean"):
		for n in $CharacterCanvasLayer.get_children():
			n.queue_free()
