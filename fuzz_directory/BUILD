cc_library(
    name = "mathlib",
    srcs = ["src/mathlib.cpp"],
    hdrs = ["src/mathlib.h"],
)
 
cc_binary(
    name = "fuzz",
    srcs = ["src/hash_fuzz_target.cpp"],
    deps = [":mathlib"],  
    copts = ["-fsanitize=fuzzer", "-fsanitize=undefined", "-g", "-O1", "-fno-omit-frame-pointer"],
    linkopts = ["-fsanitize=fuzzer", "-fsanitize=undefined"],
)
 
# Run with:  bazel run fuzz_afl
genrule(
    name = "fuzz_afl",
    srcs = [":fuzz", "input_corpus"],
    outs = ["hash_fuzz_output"],
    cmd = "AFL_SKIP_CPUFREQ=1 afl-fuzz -V 30 -i $(location input_corpus) -o $(location hash_fuzz_output) -- $(location :fuzz) @@",
    executable = True,
)