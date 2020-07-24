# An example of libraries that can be shared across multiple plugins or applications built with
# Juce.

package (
    default_visibility = ["//visibility:public"]
)

cc_library(
    name = "Config",
    defines = [
        "JUCE_STANDALONE_APPLICATION=0",
    ],
)

cc_library(
    name = "FilePath",
    hdrs = ["FilePath.h"],
    deps = ["//ThirdParty/Juce:Juce"],
)

cc_test(
    name = "FilePathTest",
    srcs = ["FilePathTest.cpp"],
    deps = [":FilePath"],
)