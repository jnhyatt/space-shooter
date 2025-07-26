extends Area3D

func kill(body: Node):
	body.queue_free()
