class_name Gun extends Node3D

@export var ammo: PackedScene

func fire():
	var bullet = ammo.instantiate() as RigidBody3D
	bullet.position = global_position
	bullet.rotation = global_rotation
	bullet.linear_velocity = global_basis.y * 80.0
	print(str(bullet.linear_velocity))
	$AnimatedSprite3D.play("fire")
	$AudioStreamPlayer3D.play()
	get_owner().get_parent().add_child(bullet)
