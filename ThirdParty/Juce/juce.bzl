# Since Juce always requires a header file AppConfig.h from the project,
# we can't build Juce as a standalone. This rule adds an AppConfig.h to
# Juce so that it may be used with a specific project.
#
# On Linux, you may need to install these packages:
# FreeType:
# sudo apt-get install libfreetype6-dev
# OpenGL:
# sudo apt-get install freeglut3-dev
# X11 tools:
# sudo apt-get install libx11-dev libxinerama-dev
# sudo apt-get install libxcursor-dev
# sudo apt-get install libxrandr-dev   # See note about xrandr below.
# Alsa:
# sudo apt-get install libasound2-dev
def juce_library(name = "Juce",
                 plugin_defines = [],
                 visibility = ["//visibility:public"]):

    all_deps = plugin_defines + [
        "//ThirdParty/Juce:JuceLibrary",
        # TODO: Only use this when necessary.
        "//ThirdParty/OpenGL:OpenGL",
        "//ThirdParty/vst3_sdk:VST3",
    ]

    all_defines = [
        "LINUX=1",
        "JUCE_DEBUG=1",
        # This is needed to prevent the plugin window from repeatedly resizing whenever it is opened
        # until the program eventually crashes. I don't know why this is necessary.
        "JUCE_USE_XRANDR=0",
        "JUCE_APP_VERSION=1.0.0",
        "JUCE_APP_VERSION_HEX=0x10000",
        # We define this because we are specifying flags through bazel and not using
        # an AppConfig.h file.
        "JUCE_GLOBAL_MODULE_SETTINGS_INCLUDED=1",
        # Definitions from AppConfig.h"
        "JUCE_MODULE_AVAILABLE_juce_audio_basics=1",
        "JUCE_MODULE_AVAILABLE_juce_audio_devices=1",
        "JUCE_MODULE_AVAILABLE_juce_audio_formats=1",
        "JUCE_MODULE_AVAILABLE_juce_audio_plugin_client=1",
        "JUCE_MODULE_AVAILABLE_juce_audio_processors=1",
        "JUCE_MODULE_AVAILABLE_juce_audio_utils=1",
        "JUCE_MODULE_AVAILABLE_juce_core=1",
        "JUCE_MODULE_AVAILABLE_juce_cryptography=1",
        "JUCE_MODULE_AVAILABLE_juce_data_structures=1",
        "JUCE_MODULE_AVAILABLE_juce_events=1",
        "JUCE_MODULE_AVAILABLE_juce_graphics=1",
        "JUCE_MODULE_AVAILABLE_juce_gui_basics=1",
        "JUCE_MODULE_AVAILABLE_juce_gui_extra=1",
        "JUCE_MODULE_AVAILABLE_juce_opengl=1",
        "JUCE_MODULE_AVAILABLE_juce_video=1",
    ]
    all_defines += select({
        "//ThirdParty/Juce:BuildForNeptune": ["JUCE_STANDALONE_APPLICATION=0"],
        "//conditions:default": [],
    })

    all_srcs = [
        "//ThirdParty/Juce:JuceSrcs"
    ] + select({
        "//ThirdParty/Juce:PluginMode": ["//ThirdParty/Juce:JucePluginFormats"],
        "//conditions:default": [],
    })
    native.cc_library (
        name = name,
        visibility = visibility,
        defines = all_defines,
        deps = all_deps,
        srcs = all_srcs,
        copts = [
            "-I/usr/include",
            "-I/usr/include/freetype2",
            "-fPIC",
            "-Wl,--no-undefined",
            # "-fvisibility=hidden",  # Used in release mode.
            "-march=native",
            '-D__cdecl=//"//"',
        ],
        linkopts = [
            "-L/usr/X11R6/lib/",
            "-lGL",
            "-lX11",
            "-lXext",
            "-lXinerama",
            "-lasound",
            "-ldl",
            # "-shared",
            "-lfreetype",
            "-lpthread",
            "-lrt",
        ],
    )
