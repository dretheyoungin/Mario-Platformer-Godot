extends Node2D

func _ready():
		# AUTOMATED CODES: Wires your hazard, victory, and stomp triggers instantly on launch!
		$DeathZone.body_entered.connect(_on_death_zone_body_entered)
		$GoalFlag.body_entered.connect(_on_goal_flag_body_entered)

		# Connect both enemy boxes to listen for the player
		$EnemyTrack/PathFollow2D/EnemyHitbox.body_entered.connect(_on_enemy_hitbox_body_entered)
		$EnemyTrack/PathFollow2D/EnemyHitbox/StompDetector.body_entered.connect(_on_stomp_detector_body_entered)

# 1. Triggers automatically when falling into the pit
func _on_death_zone_body_entered(body):
		if body.name == "Player":
				get_tree().reload_current_scene()

# 2. Triggers automatically when sprinting across the finish line!
func _on_goal_flag_body_entered(body):
		if body.name == "Player":
				print("STAGE CLEAR! VICTORY!")
				body.set_physics_process(false)

# 3. Triggers automatically when bumping into the enemy's body!
func _on_enemy_hitbox_body_entered(body):
		if body.name == "Player":
				get_tree().reload_current_scene()

# 4. Triggers automatically when landing directly on top of the enemy's head!
func _on_stomp_detector_body_entered(body):
		if body.name == "Player":
				print("ENEMY SQUASHED!")

				# Give your player character a satisfying springy bounce upward!
				body.velocity.y = -400.0

				# Instantly delete the enemy from the level map map layout!
				$EnemyTrack.queue_free()
