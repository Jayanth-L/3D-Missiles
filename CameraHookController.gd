extends Camera

var hover_car
var camera_offset = Vector3(0, 0, 0)
export var smooth_factor = 0.5
export var zoom_out_factor = 1.0

func _ready():
	hover_car = get_parent().get_node("HoverCar")
	camera_offset = translation + hover_car.translation

func _process(delta):
	look_at(get_parent().get_node("HoverCar").global_transform.origin, Vector3.UP)
	var new_pos = hover_car.translation + camera_offset * zoom_out_factor
	translation = lerp(translation, new_pos, smooth_factor)
	
