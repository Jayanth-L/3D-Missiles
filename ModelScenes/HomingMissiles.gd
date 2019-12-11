extends Spatial

export var speed = 35 * 1.3
export var steer_force = 5.0
var target = null

var velocity = Vector3(0, 0, 0)
var acceleration = Vector3(0, 0, 0)

func _ready():
	target = get_parent().get_parent().get_node("HoverCar")

func seek():
	var steer = Vector3.ZERO
	if target:
		var desired = (target.translation - translation).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer
	

func _physics_process(delta):
	acceleration += seek()
	velocity += acceleration * delta
	if velocity.length() > speed:
		velocity = velocity.normalized() * speed
	#rotation = get_rotation() * delta
	translation += velocity * delta
	# look_at(lerp(Vector3.ZERO, target.global_transform.origin, 0.8), Vector3.UP)
	look_at(target.global_transform.origin, Vector3.UP)

func get_rotation():
	var normalizrd_velocity = velocity.normalized()
	return Vector3(
		rad2deg(acos(normalizrd_velocity.dot(Vector3(1, 0, 0)))),
		rad2deg(acos(normalizrd_velocity.dot(Vector3(0, 1, 0)))),
		rad2deg(acos(normalizrd_velocity.dot(Vector3(0, 0, 1))))
	)
	




func _on_Area_body_entered(body):
	print("Player_Out")
	queue_free()


func _on_Area_area_entered(area):
	print("Missiles collided")
	queue_free()
