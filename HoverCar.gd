extends RigidBody

var PlayerSpeed = 15500
var PlayerRotationSpeed = 1000 * 1.5

func _ready():
	linear_damp = 0.99
	angular_damp = 0.99
	gravity_scale = 5

func _physics_process(Delta):
	if Input.is_action_pressed("ui_up"):
		add_central_force(global_transform.basis.xform(Vector3.FORWARD) * PlayerSpeed * Delta)
	if Input.is_action_pressed("ui_down"):
		add_central_force(global_transform.basis.xform(Vector3.FORWARD) * -PlayerSpeed * Delta)
	if Input.is_action_pressed("ui_left"):
		add_torque(Vector3.UP * PlayerRotationSpeed * Delta)
	if Input.is_action_pressed("ui_right"):
		add_torque(Vector3.UP * -PlayerRotationSpeed * Delta)
	add_central_force(global_transform.basis.xform(Vector3.FORWARD) * PlayerSpeed * Delta)
