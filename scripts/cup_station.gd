extends Node2D
var num = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Cafemanager.added_order:
		var label = Label.new()
		label.text = str(Cafemanager.orderss[num])
		num += 1
		add_child(label)
		
