extends PathFollow2D

var speed : float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var prev_prog = self.progress_ratio
	prev_prog += delta * speed
	prev_prog = 0 if prev_prog > 1 else prev_prog
	self.progress_ratio = prev_prog
