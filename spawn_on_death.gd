extends Node3D

@export var spawnees: Array[PackedScene]

func _exit_tree() -> void:
	print("A")
	for spawnee in spawnees:
		var object := spawnee.instantiate() as Node3D
		object.position = global_position
		get_parent().get_parent().add_child.call_deferred(object)
