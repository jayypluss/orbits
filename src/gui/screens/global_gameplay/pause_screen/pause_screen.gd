extends CanvasLayer

onready var pause := $Hidable
onready var resume_option := $Hidable/VBoxOptions/Resume
onready var label := $PressESCToOpenMenu


func _ready():
    if OS.has_touchscreen_ui_hint():
        label.visible = false
    else:
        # to hide the pause_button on desktop: un-comment the next line
        # pause_button.hide()
        pass


# when the node is removed from the tree (mostly because of a scene change)
func _exit_tree() -> void:
    # disable pause
    get_tree().paused = false


func _unhandled_input(event):
    if event.is_action_pressed("pause"):
        if get_tree().paused:
            resume()
        else:
            pause_game()
        get_tree().set_input_as_handled()


func resume():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    get_tree().paused = false
    pause.hide()


func pause_game():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    resume_option.grab_focus()
    get_tree().paused = true
    pause.show()


func _on_Resume_pressed():
    resume()


func _on_Main_Menu_pressed():
    Game.change_scene("res://src/gui/main_menu/menu.tscn", {
        'show_progress_bar': false
    })


func _on_PauseButton_pressed():
    pause_game()
