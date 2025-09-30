extends Node2D

var is_zoomed = false
@onready var origin = position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func handle_zoom():
	if !is_zoomed:
		position = get_viewport_rect().size/2
		scale*=2
		is_zoomed = true
	else:
		position = origin
		scale/=2
		is_zoomed = false




func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			handle_zoom()
