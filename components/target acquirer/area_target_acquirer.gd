class_name AreaTargetAcquirer
extends TargetAcquirer

@export var always_choose_closest: bool= true
@export_flags_3d_physics var detection_mask: int= 1

@onready var detection_area: Area3D = $"Detection Area"



func _ready() -> void:
	super()
	detection_area.collision_mask= detection_mask


func update_target():
	var nearest: Node3D= null
	for body in detection_area.get_overlapping_bodies():
		if not can_set_target(body): continue
		if not nearest or global_position.distance_to(body.global_position) < global_position.distance_to(nearest.global_position):
			nearest= body
	
	if nearest:
		set_target(nearest)
	else:
		cancel_target()


func _on_detection_area_body_entered(body: Node3D) -> void:
	if not has_target() and can_set_target(body):
		set_target(body)


func _on_detection_area_body_exited(body: Node3D) -> void:
	if is_target(body):
		cancel_target()
	update_target()
