package (
    default_visibility = ["//visibility:public"]
)

cc_library(
    name = "Config",
    defines = [
        'JucePlugin_Name=\\"Ants\\"',
        'JucePlugin_Version=\\"1.0.0\\"',
        "JUCE_STANDALONE_APPLICATION=1",
    ],
)

cc_binary(
    name = "Main",
    srcs = ["Main.cpp"],
    deps = [
        # Some other stuff.
        "//ThirdParty/Juce:Juce",
    ],
)
