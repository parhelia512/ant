__ANT_EDITOR__ = true

package.path = "engine/?.lua"
require "bootstrap"
import_package "ant.imgui".start {
    packagename = "tools.editor",
    w = 1920,
    h = 1080,
    ecs = {
        enable_mouse = true,
        import = {
            "@tools.editor"
        },
        feature = {
            "ant.animation",
            "ant.daynight",
            "ant.efk",
            "ant.modifier",
            "ant.motion_sampler",
            "ant.objcontroller|pickup",
            "ant.objcontroller|pickup_detect",
            "ant.objcontroller|screen_3dobj",
            "ant.rmlui",
            "ant.sky|sky",
        },
        system = {
            "tools.editor|init_system",
            "tools.editor|gizmo_system",
            "tools.editor|input_system",
            "tools.editor|grid_brush_system",
            "tools.editor|gui_system",
            "tools.editor|camera_system",
        }
    }
}