extends Area2D

var velocity =  Vector2.ZERO
const friction = 0.95

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity*delta
	if Input.is_action_pressed("ui_up"):
		velocity.y = -500
	if Input.is_action_pressed("ui_down"):
		velocity.y = 500
	if Input.is_action_pressed("ui_left"):
		velocity.x = -500
	if Input.is_action_pressed("ui_right"):
		velocity.x = 500
	
	velocity*=friction
	
	
	





func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("hello")
