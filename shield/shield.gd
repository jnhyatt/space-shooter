extends MeshInstance3D

@export var decay_speed: float = 1.0
# note that the size of the buffer created here must match the impacts_tracked const in the shader
# this can be freely changed however if you want to support more than 16 simultaneous impacts
var next_point: int = 0
var points: Array[Vector4]

func _ready() -> void:
	# i do this here so that shield nodes that share this material dont all react to impacts on one shield
	# unfortunately I can't define instance uniform arrays in the Godot shader language
	material_override = material_override.duplicate()
	points.resize(16)

func _process(delta: float) -> void:
	for i in range(points.size()):
		points[i].w = max(0.0, points[i].w - decay_speed * delta)
	material_override.set("shader_parameter/impact_points", points)

# Create a hit effect on the shield. `pos` is in world space.
func hit(pos: Vector3):
	var p = to_local(pos)
	points[next_point] = Vector4(p.x, p.y, p.z, 1.0)
	next_point = (next_point + 1) % points.size()
