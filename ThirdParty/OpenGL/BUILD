package (
    default_visibility = ["//visibility:public"]
)

licenses(["notice"])

# This rule exists only to satisfy the build generation scripts. All of the
# dependencies for this are in system headers.
cc_library (
    name = "OpenGL",
    hdrs = ["OpenGL.h"],
    linkopts = ["-lGL"],
    copts = ["-I/usr/include"],
)
