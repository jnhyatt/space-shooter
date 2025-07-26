extends RigidBody3D

var hp: int = 50

func _ready():
	linear_velocity = Vector3(
		randf_range(-1.0, 1.0),
		randf_range(-12.0, -3.0),
		0.0,
	)
	angular_velocity = Vector3(
		randf_range(-PI, PI),
		randf_range(-PI, PI),
		randf_range(-PI, PI),
	)

func take_damage(amount: int):
	hp -= amount
	if hp <= 0:
		queue_free()
