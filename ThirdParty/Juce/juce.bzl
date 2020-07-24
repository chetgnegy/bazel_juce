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
                 client_deps = [],
                 visibility = ["//visibility:public"]):

    #########################
    #        Defines        #
    #########################

    all_defines = [
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
        "//ThirdParty/Juce:BuildForSharedLibrary": ["JUCE_STANDALONE_APPLICATION=0"],
        "//conditions:default": [],
    })

    common_copts = [
        "-fPIC",
        "-Wl,--no-undefined",
        "-Wno-deprecated-declarations",
        "-march=native",
        '-D__cdecl=//"//"',
    ]

    linux_defs = ["LINUX=1"]

    osx_defs = [
        "MAC_OS_X_VERSION_MIN_REQUIRED=MAC_OS_X_VERSION_10_5",
        "DEBUG=1",
    ]

    all_defines += select({
        "@bazel_tools//src/conditions:darwin": osx_defs,
        "@bazel_tools//src/conditions:darwin_x86_64": osx_defs,
        "//conditions:default": linux_defs,
    })

    #########################
    #     Dependencies      #
    #########################

    all_deps = client_deps + [
        "//ThirdParty/Juce:JuceLibraryTextualHdrs",
        "//ThirdParty/OpenGL:OpenGL",
        "//ThirdParty/vst_sdk:VST",
        "//ThirdParty/vst3_sdk:VST3",
    ]

    #########################
    #      Main Target      #
    #########################

    linux_cc_library_target = name + "_linux"
    osx_cc_library_target = name + "_osx"

    native.cc_library (
        name = name,
        visibility = visibility,
        deps = select({
            "@bazel_tools//src/conditions:darwin": [":" + osx_cc_library_target],
            "@bazel_tools//src/conditions:darwin_x86_64": [":" + osx_cc_library_target],
            "//conditions:default": [":" + linux_cc_library_target],
        }),
    )

    #########################
    #    Linux Juce Build   #
    #########################

    native.cc_library (
        name =  linux_cc_library_target,
        visibility = ["//visibility:private"],
        defines = all_defines,
        deps = all_deps,
        srcs = ["//ThirdParty/Juce:JuceLinuxCppDeps"],
        copts = common_copts + [
            "-I/usr/include",
            "-I/usr/include/freetype2",
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

    #########################
    #     OSX Juce Build    #
    #########################

    osx_objc_library_target = name + "_osx_objc"

    native.cc_library (
        name = osx_cc_library_target,
        visibility = ["//visibility:private"],
        # This propagates the includes to the objc_library.
        includes = ["JUCE/modules"],
        defines = all_defines,
        deps = all_deps + [
            ":" + osx_objc_library_target
        ],
        srcs = select({
            "//ThirdParty/Juce:PluginMode": ["//ThirdParty/Juce:JucePluginCppDeps"],
            "//conditions:default": [],
        }),
    )

    native.objc_library (
        name = osx_objc_library_target,
        visibility = ["//visibility:private"],
        defines = all_defines,
        non_arc_srcs = ["//ThirdParty/Juce:JuceSrcsMacOSX"],
        copts = common_copts + [
            "-Wno-undeclared-selector",
        ],
        deps = all_deps,
        sdk_frameworks = [
            "Accelerate",
            "AppKit",
            "AudioToolbox",
            "AudioUnit",
            "Carbon",
            "Cocoa",
            "CoreAudio",
            "CoreAudioKit",
            "CoreMIDI",
            # "DiskRecording",
            "Foundation",
            "IOKit",
            "OpenGL",
            "QTKit",
            "QuartzCore",
            "WebKit",
        ],
    )
