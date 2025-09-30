extends Node2D

var orderss = [] # add to 
var added_order = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if added_order:
		await get_tree().process_frame
		added_order = false
		
		

func add_order(order):
	added_order = true
	orderss.append(order)
