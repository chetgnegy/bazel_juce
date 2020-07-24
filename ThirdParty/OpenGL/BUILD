package (
    default_visibility = ["//visibility:public"]
)

licenses(["notice"])

# There is probably a better way to manage OpenGL than this. I'm not claiming this to be portable.
cc_library (
    name = "OpenGL",
    hdrs = ["OpenGL.h"],
    linkopts = ["-lGL"],
    copts = ["-I/usr/include"],
)
