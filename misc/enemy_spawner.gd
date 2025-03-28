extends Node3D

@export var run_on_start: bool= true
@export var enemy_scene: PackedScene



func _ready() -> void:
	if run_on_start:
		spawn.call_deferred()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		spawn()


func spawn():
	var enemy: Enemy= enemy_scene.instantiate()
	enemy.position= global_position
	get_tree().current_scene.add_child(enemy)
