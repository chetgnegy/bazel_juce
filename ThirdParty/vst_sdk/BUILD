package (
    default_visibility = ["//visibility:public"]
)

licenses(["notice"])

cc_library(
    name = "VST",
    hdrs = glob([
        "base/source/*.h",
        "pluginterfaces/**/*.h",
        "public.sdk/**/*.h",
        # These files are included by Juce rather than compiled separately.
        "base/source/*.cpp",
        "pluginterfaces/**/*.cpp",
        "public.sdk/**/*.cpp",
    ]),
    # Without this line, we can't seem to resolve includes that are relative to the
    # ThirdParty/vst_sdk root.
    includes = ["."],
    copts = [
        "-fPIC",
        "-Wl,--no-undefined",
        "-shared",
        '-D__cdecl=//"//"',
    ],
)
