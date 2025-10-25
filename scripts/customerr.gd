extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var order = []
@export var sprite_image = null
var speech_increment = 0
signal speech_triggered

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	speech_triggered.emit() # Replace with function body.
	speech_increment+=1
