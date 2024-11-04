extends Node2D

@onready var bodyList = [$Body/Body, $Body/armUpper, $Body/armLower, $Body/Hand, $Body/legUpper, $Body/legLower, $Body/Foot, $Body/armUpper2, $Body/armLower2, $Body/Hand2, $Body/legUpper2, $Body/legLower2, $Body/Foot2]
@onready var skeletonList = [$Skeleton/Body, $Skeleton/Body/leftArm, $Skeleton/Body/leftArm/Bone2D3, $Skeleton/Body/leftArm/Bone2D3/Bone2D4, $Skeleton/Body/leftLeg, $Skeleton/Body/leftLeg/Bone2D4, $Skeleton/Body/leftLeg/Bone2D4/Bone2D5, $Skeleton/Body/rightArm, $Skeleton/Body/rightArm/Bone2D3, $Skeleton/Body/rightArm/Bone2D3/Bone2D4, $Skeleton/Body/rightLeg, $Skeleton/Body/rightLeg/Bone2D4, $Skeleton/Body/rightLeg/Bone2D4/Bone2D5]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	for i in bodyList.size():
		var body = bodyList[i]
		var skeleton = skeletonList[i]
		anchorBodyTo(body, skeleton)
	
	#var directionToBone = body.position.direction_to(skeletonBody.position)
	#var distanceToBone = body.position.distance_to(skeletonBody.position)
	#var andleToBone = angle_difference(body.rotation, skeletonBody.rotation)
	#body.linear_velocity = directionToBone * distanceToBone
	#body.angular_velocity = andleToBone

func anchorBodyTo(body:PhysicsBody2D, skeletonBody:Bone2D):
	var directionToBone = body.global_position.direction_to(skeletonBody.global_position)
	var distanceToBone = body.global_position.distance_to(skeletonBody.global_position)
	var andleToBone = angle_difference(body.rotation, skeletonBody.rotation)
	body.linear_velocity = directionToBone * distanceToBone
	#body.global_position = skeletonBody.global_position
	#body.rotation = skeletonBody.rotation
	#body.angular_velocity = andleToBone
