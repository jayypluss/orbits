extends KinematicBody

var acceleration := 1
var velocity := Vector3.ZERO

func _physics_process(delta):
#  # Lerp approach 
#  var acceleration := 1
#  global_transform.origin.x = lerp(global_transform.origin.x, GameState.previous_position.x, delta * acceleration)
#  global_transform.origin.y = lerp(global_transform.origin.y, GameState.previous_position.y, delta * acceleration)
#  global_transform.origin.z = lerp(global_transform.origin.z, GameState.previous_position.z, delta * acceleration)

  # Move and slide approach
  var speed = 20
  velocity = move_and_slide(velocity, Vector3.UP)
  look_at(GameState.previous_position, Vector3.UP)
  velocity = Vector3.FORWARD * speed
  velocity = velocity.rotated(Vector3.UP, rotation.y)
