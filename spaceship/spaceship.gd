extends RigidBody3D

class_name Player

const ACCELERATION := 120.0
const MAX_SPEED := 40.0

var hull_integrity: int = 100
var shield_strength: int = 100
var shield_charging := true

func _physics_process(delta: float) -> void:
	var target_movement_2d = Input.get_vector("move_left", "move_right", "move_down", "move_up") * MAX_SPEED
	var target_movement = Vector3(target_movement_2d.x, target_movement_2d.y, 0.0)
	var desired_delta_v = target_movement - linear_velocity
	
	# max delta-v for a single frame is ACCELERATION * delta, cap length to that
	var cap_scalar = (ACCELERATION * delta) / desired_delta_v.length()
	if cap_scalar < 1.0:
		desired_delta_v *= cap_scalar
	
	apply_impulse(desired_delta_v)

func take_damage(amount: int):
	if $InvulnerabilityTimer.time_left > 0.0:
		return
	var shield_damage = min(shield_strength, amount)
	shield_strength -= shield_damage
	if shield_damage > 0:
		$ShieldWaitTimer.start()
		$ShieldChargeTick.stop()
	hull_integrity -= amount - shield_damage
	if hull_integrity <= 0:
		queue_free()
	$InvulnerabilityTimer.start()

func tick_shield_charge():
	shield_strength = min(shield_strength + 1, 100)
