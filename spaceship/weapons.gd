extends Node3D

@export var gun_points: Array[Gun]
var next_gun_point: int = 0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("fire_lasers"):
		fire()
		$LaserCooldown.start()
	if Input.is_action_just_released("fire_lasers"):
		$LaserCooldown.stop()

func fire():
	gun_points[next_gun_point].fire()
	next_gun_point = (next_gun_point + 1) % len(gun_points)
