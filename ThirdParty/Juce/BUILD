package (
    default_visibility = ["//:__subpackages__"],
)

licenses(["notice"])

load("//ThirdParty/Juce:juce.bzl", "juce_library")

# Defines the location of the configuration flags that are used to build specific versions
# of JUCE.
# We do this so that we can generically include "ThirdParty/Juce:Juce" from various projects.
# If you think this is gross and you'd prefer to depend on a more specific build of JUCE, you
# can do what JuceForBinaryBuilder and JuceForPluginHost do below and omit this business about
# --project=... flags.
juce_library(  # name = "Juce"
  client_deps = select({
    ":BuildForSharedLibrary": ["//SharedLibrary:Config"],
    ":BuildForJuceDemoPlugin": ["//ThirdParty/Juce/PluginDemo:AppConfig"],
    "//conditions:default": [],
  }),
  visibility = ["//visibility:public"],
)

# If you're building something in the SharedLibrary you can get away with omitting this flag.
# However, that may no longer be true if //SharedLibrary:Config becomes non-trivial.
# I believe this is possible only because we have a special condition for defining
# JUCE_STANDALONE_APPLICATION in juce.bzl.
config_setting(
    name = "BuildForSharedLibrary",
    values = { "define": "project=sharedlibrary" },
)

# Write your own version of this and the add an entry to the select statement above.
config_setting(
    name = "BuildForJuceDemoPlugin",
    values = { "define": "project=juce_plugin_demo" },
)

config_setting(
    name = "PluginMode",
    values = { "define": "mode=plugin" },
)

####################################################################################################
##################################### JUCE PRIVATE BUILD RULES #####################################
####################################################################################################
cc_library (
    name = "JuceLibraryTextualHdrs",
    textual_hdrs = [
        "JuceHeader.h",
        "Juce.h",
    ] + glob([
        "JUCE/modules/*/**/*.c",
        "JUCE/modules/*/**/*.cpp",
        "JUCE/modules/*/**/*.h",
        "JUCE/modules/*/**/*.mm",
    ]),
    includes = [
        "./JUCE/modules"
    ],
    deps = ["//ThirdParty/OpenGL:OpenGL"],
)

filegroup(
    name = "JuceLinuxCppDeps",
    srcs = [
        ":JucePluginCppDeps",
        "JUCE/modules/juce_audio_basics/juce_audio_basics.cpp",
        "JUCE/modules/juce_audio_devices/juce_audio_devices.cpp",
        "JUCE/modules/juce_audio_formats/juce_audio_formats.cpp",
        "JUCE/modules/juce_audio_processors/juce_audio_processors.cpp",
        "JUCE/modules/juce_audio_utils/juce_audio_utils.cpp",
        "JUCE/modules/juce_core/juce_core.cpp",
        "JUCE/modules/juce_data_structures/juce_data_structures.cpp",
        "JUCE/modules/juce_events/juce_events.cpp",
        "JUCE/modules/juce_graphics/juce_graphics.cpp",
        "JUCE/modules/juce_gui_basics/juce_gui_basics.cpp",
        "JUCE/modules/juce_gui_extra/juce_gui_extra.cpp",
        "JUCE/modules/juce_opengl/juce_opengl.cpp",
    ],
)

filegroup(
    name = "JucePluginCppDeps",
    srcs = select({
        "//ThirdParty/Juce:PluginMode": [
            "JUCE/modules/juce_audio_plugin_client/juce_audio_plugin_client_utils.cpp",
            "JUCE/modules/juce_audio_plugin_client/juce_audio_plugin_client_VST2.cpp",
            "JUCE/modules/juce_audio_plugin_client/juce_audio_plugin_client_VST3.cpp",
        ],
        "//conditions:default": [],
    }),
)

filegroup(
    name = "JuceSrcsMacOSX",
    srcs = [
        "JUCE/modules/juce_audio_basics/juce_audio_basics.mm",
        "JUCE/modules/juce_audio_devices/juce_audio_devices.mm",
        "JUCE/modules/juce_audio_formats/juce_audio_formats.mm",
        "JUCE/modules/juce_audio_processors/juce_audio_processors.mm",
        "JUCE/modules/juce_audio_utils/juce_audio_utils.mm",
        "JUCE/modules/juce_core/juce_core.mm",
        "JUCE/modules/juce_data_structures/juce_data_structures.mm",
        "JUCE/modules/juce_events/juce_events.mm",
        "JUCE/modules/juce_graphics/juce_graphics.mm",
        "JUCE/modules/juce_gui_basics/juce_gui_basics.mm",
        "JUCE/modules/juce_gui_extra/juce_gui_extra.mm",
        "JUCE/modules/juce_opengl/juce_opengl.mm",
    ] + select({
        "//ThirdParty/Juce:PluginMode": [
            "JUCE/modules/juce_audio_plugin_client/juce_audio_plugin_client_VST_utils.mm",
            "JUCE/modules/juce_audio_plugin_client/juce_audio_plugin_client_AU_1.mm",
            "JUCE/modules/juce_audio_plugin_client/juce_audio_plugin_client_AU_2.mm",
        ],
        "//conditions:default": [],
    }),
)

juce_library(
    name = "JuceForBinaryBuilder",
    client_deps = ["//ThirdParty/Juce/BinaryBuilder:AppConfig"],
)

juce_library(
    name = "JuceForPluginHost",
    client_deps = ["//ThirdParty/Juce/PluginHost:AppConfig"],
)