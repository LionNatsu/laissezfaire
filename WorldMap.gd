extends Node2D

var _dragging_from : Neuron

#
#class Drag:
#	var begin: WeakRef
#	var end: WeakRef
#	func begin()

# Called when the node enters the scene tree for the first time.
func _ready():
	$NeuronPrototype.visible = false
	$AxonPrototype.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _character_mousedown(_viewport:Node, event:InputEvent, _shape_idx:int, which:Neuron):
	if event.is_action_pressed("drag"):
		_dragging_from = which
		
	elif event.is_action_released("drag") and _dragging_from != which:
		var axon = $AxonPrototype.duplicate() as Axon
		axon.connect_neuron(_dragging_from, which)
		$CanvasLayer.add_child(axon)
		axon.visible = true

func _unhandled_key_input(event):
	if event.is_action_pressed("new"):
		var neuron = $NeuronPrototype.duplicate() as Neuron
		neuron.input_event.connect(_character_mousedown.bind(neuron))
		neuron.translate(get_viewport().get_mouse_position())
		$CanvasLayer.add_child(neuron)
		neuron.visible = true
		
	elif event.is_action_pressed("clean"):
		for n in $CanvasLayer.get_children():
			n.queue_free()
