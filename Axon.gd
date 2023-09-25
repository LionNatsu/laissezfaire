extends Path2D
class_name Axon

var from: Neuron
var to: Neuron

func connect_neuron(from: Neuron, to:Neuron):
	self.from = from
	self.to = to
	self.curve = Curve2D.new()
	self.curve.add_point(from.position)
	self.curve.add_point(to.position)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = get_parent().name == 'CanvasLayer'

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
