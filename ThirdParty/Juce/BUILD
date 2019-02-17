package (
    default_visibility = ["//:__subpackages__"],
)

licenses(["notice"])

load("//ThirdParty/Juce:juce.bzl", "juce_library")

# Defines the location of the configuration flags that are used to build specific versions
# of JUCE.
juce_library(  # name = "Juce"
  plugin_defines = select({
    ":BuildForMyProject": ["//MyProject:Config"],
    "//conditions:default": [],
  }),
  visibility = ["//visibility:public"],
)

config_setting(
    name = "BuildForMyProject",
    values = { "define": "project=project" },
)

config_setting(
    name = "PluginMode",
    values = { "define": "mode=plugin" }
)

####################################################################################################
##################################### JUCE PRIVATE BUILD RULES #####################################
####################################################################################################

cc_library (
    name = "JuceLibrary",
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
    name = "AllJuceFiles",
    srcs = glob([
        # Contains the main entry points into Juce.
        "JUCE/modules/**/*.c",
        "JUCE/modules/**/*.cpp",
        "JUCE/modules/**/*.h",
        # Contains the actual implementation details.
        "JUCE/modules/*/**/*.c",
        "JUCE/modules/*/**/*.cpp",
        "JUCE/modules/*/**/*.h",
    ]),
)

filegroup(
    name = "JuceHeaders",
    srcs = [
        "JuceHeader.h",
        "Juce.h",
    ],
)

filegroup(
    name = "JuceSrcs",
    srcs = [
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
    ]
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
    ]
)

filegroup(
    name = "JucePluginFormats",
    srcs = [
        "JUCE/modules/juce_audio_plugin_client/juce_audio_plugin_client_utils.cpp",
        "JUCE/modules/juce_audio_plugin_client/VST/juce_VST_Wrapper.cpp",
        "JUCE/modules/juce_audio_plugin_client/VST3/juce_VST3_Wrapper.cpp",
    ]
)

filegroup(
    name = "JucePluginFormatsMacOSX",
    srcs = [
        "JUCE/modules/juce_audio_plugin_client/juce_audio_plugin_client_VST_utils.mm",
    ]
)

juce_library(
    name = "JuceForBinaryBuilder",
    plugin_deps = ["//ThirdParty/Juce/BinaryBuilder:AppConfig"],
)

juce_library(
    name = "JuceForPluginHost",
    plugin_deps = ["//ThirdParty/Juce/PluginHost:AppConfig"],
)

juce_library(
    name = "JuceForPluginDemo",
    plugin_deps = ["//ThirdParty/Juce/PluginDemo:AppConfig"],
)