extends Spatial

# For other Game info see "Game" singleton (uncomment for reference): 
# Game

var elapsed = 0


# `pre_start()` is called when a scene is loaded.
# Use this function to receive params from `Game.change_scene(params)`.
func pre_start(params):
    var cur_scene: Node = get_tree().current_scene
    print("Current scene is: ", cur_scene.name, " (", cur_scene.filename, ")")
    print("level_1.gd: pre_start() called with params = ")
    if params:
        for key in params:
            var val = params[key]
            printt("", key, val)
    print("Processing...")
    yield(get_tree().create_timer(2), "timeout")
    print("Done")
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# `start()` is called when the graphic transition ends.
func start():
    print("level_1.gd: start() called")


func _process(delta):
    elapsed += delta
