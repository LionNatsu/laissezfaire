extends Area2D
class_name Neuron

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = get_parent().name == 'CanvasLayer'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
