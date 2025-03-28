class_name NavigationTarget
extends MeshInstance3D

signal position_changed



func update_position(new_position: Vector3):
	global_position.x= new_position.x
	global_position.z= new_position.z
	position_changed.emit()
