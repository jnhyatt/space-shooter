extends Node3D

@export var star: PackedScene
@export var spawn_rate: float

var spawn_timer: float = 0.0

func _process(delta: float) -> void:
	spawn_timer += delta
	while spawn_timer > 0:
		spawn_star()
		spawn_timer -= 1.0 / spawn_rate;

func spawn_star():
	var near_corner = global_position - $CollisionShape3D.shape.extents
	var far_corner = global_position + $CollisionShape3D.shape.extents
	var new_star: Node3D = star.instantiate()
	new_star.position.x = randf_range(near_corner.x, far_corner.x)
	new_star.position.y = randf_range(near_corner.y, far_corner.y)
	new_star.position.z = randf_range(near_corner.z, far_corner.z)
	get_parent().add_child(new_star)
