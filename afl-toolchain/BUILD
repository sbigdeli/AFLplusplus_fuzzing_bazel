package(default_visibility = ["//visibility:public"])
 
load(":cc_toolchain_config_afl.bzl", "cc_toolchain_config")
 
filegroup(name = "empty")
 
cc_toolchain_config(name = "linux_x86_64_afl_toolchain_config")
 
cc_toolchain(
    name = "linux_x86_64_toolchain_afl",
    toolchain_identifier = "linux_x86_64-afl-toolchain",
    toolchain_config = ":linux_x86_64_afl_toolchain_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)
 
toolchain(
    name = "cc_toolchain_for_linux_x86_64_afl",
    toolchain = ":linux_x86_64_toolchain_afl",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
)
 
 
 