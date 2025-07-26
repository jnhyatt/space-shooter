extends RigidBody3D

@export var max_hp: int = 200
var hp: int = max_hp

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

func take_damage(amount: int, _pos):
	hp -= amount
	if hp <= 0:
		queue_free()
