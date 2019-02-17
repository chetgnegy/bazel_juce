package (
    default_visibility = ["//visibility:public"]
)

licenses(["notice"])

cc_library(
    name = "VST3",
    hdrs = [
        "pluginterfaces/base/funknown.h",
        "pluginterfaces/vst2.x/aeffect.h",
        "pluginterfaces/vst2.x/aeffectx.h",
        "pluginterfaces/vst2.x/vstfxstore.h",
        "public.sdk/source/vst2.x/aeffeditor.h",
        "public.sdk/source/vst2.x/audioeffect.h",
        "public.sdk/source/vst2.x/audioeffectx.h",
        # These files are included by Juce rather than compiled separately.
        "public.sdk/source/vst2.x/audioeffectx.cpp",
        "public.sdk/source/vst2.x/audioeffect.cpp",
    ],
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
