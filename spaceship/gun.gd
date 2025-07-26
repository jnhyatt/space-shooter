extends Node3D

class_name Gun

@export var ammo: PackedScene

func fire():
	var bullet = ammo.instantiate() as Node3D
	bullet.position = global_position
	$AnimatedSprite3D.play("fire")
	$AudioStreamPlayer3D.play()
	get_owner().get_parent().add_child(bullet)
