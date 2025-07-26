extends CanvasLayer

@export var player: Player

func _process(_delta: float) -> void:
	$GridContainer/BarHull.value = player.hull_integrity
	$GridContainer/BarShield.value = player.shield_strength
