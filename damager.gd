extends Node3D

@export var damage: int

func deal_damage_to(body: Node):
	var body_3d = body as Node3D
	if not body_3d:
		return
	if body.has_method("take_damage"):
		body.take_damage(damage, (body_3d.global_position + global_position) / 2.0)
