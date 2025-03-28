class_name TargetAcquirer
extends Node3D

@export var enable_update_interval: bool= true
@export var update_interval: float= 1.0

@export var enable_los: bool= true
@export var los_raycast_length: float= 1.0
@export_flags_3d_physics var los_raycast_mask: int

@export var debug: bool= false

var target_ref: WeakRef
var update_timer: Timer



func _ready():
	if enable_update_interval:
		update_timer= Timer.new()
		add_child(update_timer)
		update_timer.wait_time= update_interval
		update_timer.start()
		update_timer.timeout.connect(_on_update_timer_timeout)

	if debug:
		debug_label_target= Label3D.new


func update_target():
	pass


func set_target(node: Node3D):
	target_ref= weakref(node)


func has_target()-> bool:
	return target_ref and target_ref.get_ref()


func get_target_position()-> Vector3:
	return ( target_ref.get_ref() as Node3D ).global_position


func is_target(body: Node3D)-> bool:
	return target_ref and target_ref.get_ref() == body


func cancel_target():
	target_ref= null


func can_set_target(node: Node3D)-> bool:
	if not enable_los:
		return true
	else:
		var ray_query:= PhysicsRayQueryParameters3D.create(global_position, node.global_position, los_raycast_mask)
		var result: Dictionary= get_world_3d().direct_space_state.intersect_ray(ray_query)
		if not result.is_empty():
			if result.collider == node:
				return true
		return false


func _on_update_timer_timeout() -> void:
	update_target()
