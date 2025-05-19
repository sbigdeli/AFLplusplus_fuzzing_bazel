load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
)
 
all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]
 
def _impl(ctx):
    tool_paths = [
        tool_path(name="gcc", path="/usr/bin/afl-clang-fast++"), # Using afl-clang-fast++ to compile
        tool_path(name="clang", path="/usr/bin/afl-clang-fast++"),
        tool_path(name="ld", path="/usr/bin/ld"),
        tool_path(name="ar", path="/usr/bin/ar"),
        tool_path(name="cpp", path="/usr/bin/cpp"),
        tool_path(name="gcov", path="/usr/bin/gcov"),
        tool_path(name="nm", path="/usr/bin/nm"),
        tool_path(name="objdump", path="/usr/bin/objdump"),
        tool_path(name="strip", path="/usr/bin/strip"),
    ]
 
    features = [
        feature(
            name="default_linker_flags",
            enabled=True,
            flag_sets=[
                flag_set(
                    actions=all_link_actions,
                    flag_groups=[
                        flag_group(
                            flags=[
                                "-lstdc++",  # C++ standard library
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ]
 
    return cc_common.create_cc_toolchain_config_info(
        ctx=ctx,
        cxx_builtin_include_directories=[
            "/usr/lib/llvm-17/lib/clang/17/include",  # Path to clang-includes
            "/usr/include",  # Regular system-includes
        ],
        toolchain_identifier=":cc_toolchain_config",
        host_system_name="local",
        target_system_name="local",
        target_cpu="k8",
        target_libc="unknown",
        compiler="afl-clang-fast++",  # Using afl-clang-fast++ to compile
        abi_version="unknown",
        abi_libc_version="unknown",
        tool_paths=tool_paths,
    )
 
cc_toolchain_config = rule(
    implementation=_impl,
    attrs={},
    provides=[CcToolchainConfigInfo],
)
 
 
 