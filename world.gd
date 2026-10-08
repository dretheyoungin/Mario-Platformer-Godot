extends Node2D

func _ready():
		# AUTOMATED CODES: This automatically wires your nodes together behind the scenes!
		$DeathZone.body_entered.connect(_on_death_zone_body_entered)
		$GoalFlag.body_entered.connect(_on_goal_flag_body_entered)

# 1. Triggers automatically when falling into the pit
func _on_death_zone_body_entered(body):
		if body.name == "Player":
				get_tree().reload_current_scene()

# 2. Triggers automatically when sprinting across the finish line!
func _on_goal_flag_body_entered(body):
		if body.name == "Player":
				# Print a success validation note to your bottom debugger panel!
				print("STAGE CLEAR! VICTORY!")

				# Freeze your character's physics engine so he stops running!
				body.set_physics_process(false)
