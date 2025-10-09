extends Node2D
#ducks si sisisisisis yes
@onready var customer_timer = $Timer

var min_customer_appearance_time = 10
var max_customer_appearance_time = 15
var num_customers_current = 0
var customer_arriving = false
var customer_scene = preload("res://scenes/customerr.tscn")
var order_param = { #Each order param corresponds to one of the stations
					"size":		["Small","Medium","Large"], 
					"brew":		["Espresso", "Tea"], 
					"mix":		["Milk", "Soy Milk", "Ice", "Syrup"], 
					"topping":	["Whipped Cream", "Sprinkles"],
					"plating":	["Sandwich", "Muffin"]
					}


# Called when the node enters the scene tree for the first time.
func _ready():
	print("beginning cafe day")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If there are no customers and one is not already arriving, set up a new one
	if num_customers_current < 1 and !customer_arriving:
		setup_random_customer()

func setup_random_customer():
	# Set a random wait time for the next customer arrival
	customer_arriving = true
	var random_wait = randf_range(min_customer_appearance_time, max_customer_appearance_time)
	customer_timer.wait_time = random_wait
	customer_timer.timeout.connect(_on_timer_timeout)
	customer_timer.start()
	
func create_order() -> Array:
	
	var order = []
	var keys = order_param.keys()
	print(keys)
	for i in range(5):
		var idx = randi_range(0, len(order_param[keys[i]]))
		order.append(order.get(keys[i], idx))
	#Cafemanager.orderss.append(order)
	return order

func getmessages():
	var file = FileAccess.open("poopoop.json", FileAccess.READ)
	var json_string = file.get_as_text()
	file.close()

	var json = JSON.new()
	var parse_result = json.parse(json_string)
	var data = json.data
	print(data["easy"])
	
func _on_timer_timeout():
	# Remove any existing order labels from the scene
	for child in get_children():
		if child is Label:
			child.queue_free()
	
	# Create and add the customer sprite
	'''var new_customer = Sprite2D.new()
	new_customer.texture = load("res://sprites/standard_duck.png")
	new_customer.position = get_viewport_rect().get_center()
	new_customer.scale = Vector2(0.3, 0.3)
	var customer_walk = create_tween()
	await customer_walk.tween_property(new_customer, "scale", Vector2(.75, .75), 3)
	add_child(new_customer)'''
	
	var new_customer = customer_scene.instantiate()
	new_customer.sprite
	
	# Create and add the order label above the customer
	var order_label = Label.new()
	#order_label.text = orders[randi() % orders.size()]
	order_label.add_theme_font_size_override("font_size", 64)
	order_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	order_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	order_label.position = new_customer.position + Vector2(-130, -100)
	add_child(order_label)
	
	# Mark that a customer has arrived
	customer_arriving = false
	num_customers_current += 1
