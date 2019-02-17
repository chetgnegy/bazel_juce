package (
    default_visibility = ["//ThirdParty/Juce:__subpackages__"],
)

licenses(["notice"])

load("//ThirdParty/Juce:juce.bzl", "juce_library")

cc_library(
  name = "AppConfig",
  defines = [
      "JUCE_STANDALONE_APPLICATION=1",
      "JUCE_GLOBAL_MODULE_SETTINGS_INCLUDED=1",
  ]
)

cc_binary(
    name = "BinaryBuilder",
    deprecation = "\n\nYou will need to update the header include in the created .cpp file!\n\n",
    srcs = [
        # This first header gets ignored. Make sure :AppConfig above defines these flags.
        ":JuceLibraryCode/AppConfig.h",
        ":JuceLibraryCode/JuceHeader.h",
    ] + glob(["Source/*"]),
    deps = ["//ThirdParty/Juce:JuceForBinaryBuilder"],
)