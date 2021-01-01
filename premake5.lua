project "glfw"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("obj/" .. outputdir .. "/%{prj.name}")
    
    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/internal.h",
        "src/mappings.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }

    filter "system:windows"
        systemversion "latest"
        
        files
        {
            "win32_platform.h",
            "win32_joystick.h",
            "wgl_context.h",
            "egl_context.h",
            "osmesa_context.h",
            "win32_init.c",
            "win32_joystick.c",
            "win32_monitor.c",
            "win32_time.c",
            "win32_thread.c",
            "win32_window.c",
            "wgl_context.c",
            "egl_context.c",
            "osmesa_context.c",
        }

        defines "_GLFW_WIN32"

    filter "system:macosx"
        
        files
        {
            "cocoa_platform.h",
            "cocoa_joystick.h",
            "posix_thread.h",
            "nsgl_context.h",
            "egl_context.h",
            "osmesa_context.h",
            "cocoa_init.m",
            "cocoa_joystick.m",
            "cocoa_monitor.m",
            "cocoa_window.m",
            "cocoa_time.c",
            "posix_thread.c",
            "nsgl_context.m",
            "egl_context.c",
            "osmesa_context.c",
        }

        defines "_GLFW_COCOA"

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"