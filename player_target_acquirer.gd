class_name PlayerTargetAcquirer
extends TargetAcquirer

@export var start_with_know_player_pos: bool= false



func _ready() -> void:
	super()
	if start_with_know_player_pos and Global.player_entity:
		set_target(Global.player_entity)


func update_target():
	if Global.player_entity and can_set_target(Global.player_entity):
		set_target(Global.player_entity)
	else:
		cancel_target()
