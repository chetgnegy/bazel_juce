package (
    default_visibility = ["//:__subpackages__"],
)

licenses(["notice"])

load("//ThirdParty/Juce:juce.bzl", "juce_library")

# Defines the location of the configuration flags that are used to build specific versions
# of JUCE.
# We do this so that we can generically include "ThirdParty/Juce:Juce" from various projects.
# If you think this is gross and you'd prefer to depend on a more specific build of JUCE, you
# can do what JuceForPluginHost does below and omit this business about --project=... flags.
juce_library(  # name = "Juce"
  client_deps = select({
    ":BuildForSharedLibrary": ["//SharedLibrary:Config"],
    ":BuildForMyAwesomePlugin": ["//MyAwesomePlugin:Config"],
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
    name = "BuildForMyAwesomePlugin",
    values = { "define": "project=my_awesome_plugin" },
)

config_setting(
    name = "PluginMode",
    values = { "define": "mode=plugin" },
)

cc_binary (
    name = "PluginHost",
    srcs = ["JUCE/extras/AudioPluginHost/Source/HostStartup.cpp"],
    deps = [
        ":JucePluginHostDeps",
        "//ThirdParty/Juce:JuceForPluginHost",
    ]
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
        "JUCE/modules/juce_dsp/juce_dsp.cpp",
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
        "JUCE/modules/juce_dsp/juce_dsp.mm",
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
    name = "JuceForPluginHost",
    client_deps = ["//ThirdParty/Juce:PluginHostAppConfig"],
)

cc_library (
  name = "PluginHostAppConfig",
  defines = [
      "JUCE_APP_VERSION=1.0.0",
      "JUCE_APP_VERSION_HEX=0x10000",
      "JUCE_DISPLAY_SPLASH_SCREEN=0",
      "JUCE_USE_DARK_SPLASH_SCREEN=1",
      "JUCE_PROJUCER_VERSION=0x60001",
      "JUCE_GLOBAL_MODULE_SETTINGS_INCLUDED=1",
      "JUCE_WASAPI=1",
      "JUCE_DIRECTSOUND=1",
      "JUCE_ALSA=1",
      "JUCE_USE_FLAC=1",
      "JUCE_USE_OGGVORBIS=1",
      "JUCE_PLUGINHOST_VST3=1",
      "JUCE_PLUGINHOST_AU=1",
      "JUCE_PLUGINHOST_LADSPA=1",
      "JUCE_USE_CDREADER=0",
      "JUCE_USE_CDBURNER=0",
      "JUCE_WEB_BROWSER=0",
      "JUCE_USE_CAMERA=0",
      "JUCE_STANDALONE_APPLICATION=1",
  ]
)

# The way JUCE PluginHosts's sample plugins looks for files is dependent on the binary location.
# There needs to be a directory "examples" somewhere in the parent's path with subdirectory
# Assets containing these files.
#
# This will probably break every time Juce decides to fiddle with their examples.

genrule(
  name = "singing",
  srcs = ["JUCE/examples/Assets/singing.ogg"],
  cmd = "cp $< $@",
  outs = ["examples/Assets/singing.ogg",],
)

genrule(
  name = "guitar_amp",
  srcs = ["JUCE/examples/Assets/guitar_amp.wav"],
  cmd = "cp $< $@",
  outs = ["examples/Assets/guitar_amp.wav",],
)

genrule(
  name = "reverb_ir",
  srcs = ["JUCE/examples/Assets/reverb_ir.wav"],
  cmd = "cp $< $@",
  outs = ["examples/Assets/reverb_ir.wav",],
)

genrule(
  name = "cello",
  srcs = ["JUCE/examples/Assets/cello.wav"],
  cmd = "cp $< $@",
  outs = ["examples/Assets/cello.wav",],
)

cc_library (
    name = "JucePluginHostDeps",
    hdrs = [
        "JUCE/extras/AudioPluginHost/JuceLibraryCode/JuceHeader.h",
    ] + glob([
        "JUCE/extras/AudioPluginHost/Source/Plugins/*.h",
        "JUCE/extras/AudioPluginHost/Source/UI/*.h",
    ]),
    data = [
        ":singing",
        ":guitar_amp",
        ":reverb_ir",
        ":cello",
    ],
    includes = [
        "JUCE/extras/AudioPluginHost/JuceLibraryCode",
    ],
    srcs = [
        "JUCE/examples/Assets/DemoUtilities.h",
    ] + glob([
        "JUCE/examples/Plugins/*.h",
        "JUCE/extras/AudioPluginHost/JuceLibraryCode/BinaryData.*",
        "JUCE/extras/AudioPluginHost/Source/*.cpp",
        "JUCE/extras/AudioPluginHost/Source/Plugins/*.cpp",
        "JUCE/extras/AudioPluginHost/Source/UI/*.cpp",
    ]),
    deps = [
        "//ThirdParty/Juce:JuceForPluginHost",
    ],
)