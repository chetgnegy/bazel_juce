package (
    default_visibility = ["//ThirdParty/Juce:__subpackages__"],
)

licenses(["notice"])

load("//ThirdParty/Juce:juce.bzl", "juce_library")

cc_binary (
    name = "App",
    srcs = [":Source/HostStartup.cpp"],
    deps = [
        ":JucePluginHostDeps",
        "//ThirdParty/Juce:JuceForPluginHost",
    ]
)

cc_library (
  name = "AppConfig",
  defines = [
      "JUCE_WASAPI=1",
      "JUCE_DIRECTSOUND=1",
      "JUCE_ALSA=1",
      "JUCE_PLUGINHOST_VST=1",
      "JUCE_PLUGINHOST_VST3=1",
      "JUCE_PLUGINHOST_AU=1",
      "JUCE_USE_CDREADER=0",
      "JUCE_USE_CDBURNER=0",
      "JUCE_USE_FLAC=0",
      "JUCE_USE_OGGVORBIS=0",
      "JUCE_WEB_BROWSER=0",
      "JUCE_QUICKTIME=0",
      "JUCE_USE_CAMERA=0",
      "JucePlugin_Build_VST=1",
      "JucePlugin_Build_VST3=1",
      "JucePlugin_Build_AU=1",
      "JucePlugin_ManufacturerCode=\\'Manu\\'",
      "JucePlugin_PluginCode=\\'Plug\\'",
      "JucePlugin_IsSynth=0",
      "JucePlugin_WantsMidiInput=1",
      "JucePlugin_ProducesMidiOutput=1",
      "JucePlugin_IsMidiEffect=0",
      "JucePlugin_EditorRequiresKeyboardFocus=1",
      "JucePlugin_MaxNumInputChannels=2",
      "JucePlugin_MaxNumOutputChannels=2",
      "JucePlugin_PreferredChannelConfigurations={2,2}",
      "JUCE_STANDALONE_APPLICATION=1",
  ]
)

cc_library (
    name = "JucePluginHostDeps",
    hdrs = [
        # This first header gets ignored. Make sure :AppConfig above defines these flags.
        ":JuceLibraryCode/AppConfig.h",
        ":JuceLibraryCode/JuceHeader.h",
    ] + glob(["Source/*.h"]),
    srcs = glob(["Source/*.cpp"]),
    deps = ["//ThirdParty/Juce:JuceForPluginHost"],
)
