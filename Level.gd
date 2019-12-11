extends Node

# Special thanks to : https://www.reddit.com/user/Cykyrios/ for his Great help

# warning-ignore:unused_argument
func _process(delta):
	$LevelCamera.look_at(lerp(Vector3.ZERO, $HoverCar.global_transform.origin, 0.1), Vector3.UP)
