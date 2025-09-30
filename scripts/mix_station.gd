extends Node2D

@onready var fridge = $Fridge

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_fridge_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index and event.pressed:
			pass # Replace with function body.
