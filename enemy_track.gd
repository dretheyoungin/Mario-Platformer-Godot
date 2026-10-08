extends Path2D

func _process(delta):
		# Slide the enemy forward along the track line continuously!
		$PathFollow2D.progress += 150 * delta
