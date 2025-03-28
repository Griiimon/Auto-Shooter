class_name PlayerTargetAcquirer
extends TargetAcquirer

@export var start_with_know_player_pos: bool= false



func _ready() -> void:
	if start_with_know_player_pos and Global.player_entity:
		set_target(Global.player_entity)
