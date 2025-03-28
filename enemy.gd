class_name Enemy
extends Entity

@onready var player_target_acquirer: PlayerTargetAcquirer = $PlayerTargetAcquirer



func update_target():
	if player_target_acquirer.has_target():
		navigation_agent.target_position= player_target_acquirer.get_target_position()


func _on_pathfinding_update_timeout() -> void:
	update_target()


func _on_player_target_acquirer_found_new_target() -> void:
	update_target()
