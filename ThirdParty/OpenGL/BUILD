package (
    default_visibility = ["//visibility:public"]
)

licenses(["notice"])

# There is probably a better way to manage OpenGL than this. I'm not claiming this to be portable.
cc_library (
    name = "OpenGL",
    textual_hdrs = ["OpenGL.h"],
    linkopts = select({
        "@bazel_tools//src/conditions:darwin": [],
        "@bazel_tools//src/conditions:darwin_x86_64": [],
        "//conditions:default": [
             "-lglut",
             "-lGL",
             "-lGLU",
        ],
    }),
    copts = ["-I/usr/include"],
)