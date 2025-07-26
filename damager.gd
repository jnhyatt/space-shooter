extends Node

@export var damage: int

func deal_damage_to(body: Node):
	if body.has_method("take_damage"):
		body.take_damage(damage)
