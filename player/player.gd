extends Node2D

@onready var body: RigidBody2D = $Body/Body
@onready var skeletonBody: Bone2D = $Skeleton/Body



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var directionToBone = body.position.direction_to(skeletonBody.position)
	var distanceToBone = body.position.distance_to(skeletonBody.position)
	var andleToBone = angle_difference(body.rotation, skeletonBody.rotation)
	#body.apply_central_force(directionToBone * distanceToBone)
	body.linear_velocity = directionToBone * distanceToBone
	body.angular_velocity = andleToBone
