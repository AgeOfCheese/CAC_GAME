extends Node2D

@onready var ring_timer = $Timer

var is_zoomed = false
@onready var origin = position
@onready var apps = $Smartphone/Apps
@onready var audio_player = $AudioStreamPlayer2D

var max_ring_interval = 10
var min_ring_interval = 12
# Called when the node enters the scene tree for the first time.
func _ready():
	setup_random_ring()
	getmessages()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func handle_zoom():
	if !is_zoomed:
		position = get_viewport_rect().size/2
		scale*=4
		apps.visible = true
		is_zoomed = true
		if audio_player.playing:
			audio_player.stop()
	else:
		position = origin
		scale/=4
		is_zoomed = false
		apps.visible = false



func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			handle_zoom()


func _on_timer_timeout():
	if audio_player.stream:

		audio_player.play()


func getmessages():
	# Load your JSON file
	var file = FileAccess.open("poopoop.json", FileAccess.READ)
	var json_string = file.get_as_text()
	var json_data = JSON.parse_string(json_string)

	if json_data is Dictionary:
		# Access difficulty levels
		var easy_scenarios = json_data.get("easy", [])
		var medium_scenarios = json_data.get("medium", [])
		var hard_scenarios = json_data.get("hard", [])

		# Example: Access first easy scenario
		if easy_scenarios.size() > 0:
			var first_easy = easy_scenarios[0]
			var id = first_easy.get("id", "")
			var type = first_easy.get("type", "")
			var caller_id = first_easy.get("caller_id", "")
			var dialogue = first_easy.get("dialogue", [])
			var red_flags = first_easy.get("red_flags", [])
			var clues_real = first_easy.get("clues_real", "")
			var correct_action = first_easy.get("correct_action", "")

			print("ID: ", id)
			print("Type: ", type)
			print("Caller ID: ", caller_id)

			# Print dialogue lines
			for line in dialogue:
				print("Dialogue: ", line)

			# Print red flags
			for flag in red_flags:
				print("Red Flag: ", flag)

			print("Clues: ", clues_real)
			print("Action: ", correct_action)

	

func setup_random_ring():
	# Set a random wait time for the next ring
	var random_wait = randf_range(min_ring_interval, max_ring_interval)
	ring_timer.wait_time = random_wait
	ring_timer.timeout.connect(_on_timer_timeout)
	ring_timer.start()
