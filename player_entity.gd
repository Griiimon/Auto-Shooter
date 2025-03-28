class_name PlayerEntity
extends Entity

var move_vec: Vector2



func _ready() -> void:
	Global.player_entity= self


func _process(delta: float) -> void:
	move_vec= Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")


func get_destination()-> Vector3:
	return global_position + Vector3(move_vec.x, 0, move_vec.y)
