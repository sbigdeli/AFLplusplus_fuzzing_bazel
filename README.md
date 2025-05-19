# AFL++ Toolchain Configuration for Bazel
 
This Bazel toolchain configuration is designed to integrate AFL++ with Bazel builds for C++ code. By setting afl-clang-fast++ as the compiler, it ensures that the resulting binaries are instrumented for AFL++ fuzzing. The configuration includes necessary paths, compatibility constraints, and linker flags to create a reliable toolchain for fuzz testing on Linux x86_64 systems.

1. Create a fuzzing harness
2. Build the binary with afl-toolchain
    ```bash
    bazel build <binary_name> --extra_toolchains=@rules_vcc//toolchain/afl:cc_toolchain_for_linux_x86_64_afl
    ```
3. Create input directory and add inputs
4. Run the binary
    ```bash
    afl-fuzz -i path/to/input -o path/to/output -- path/to/binary
    ```

1. export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
2. export AFL_SKIP_CPUFREQ=1
3. bazelisk build //fuzz_directory:fuzz --extra_toolchains=//afl-toolchain:cc_toolchain_for_linux_x86_64_afl
4. afl-fuzz -i /home/sbigdeli/Desktop/LIA2/rdswf-lund-lia-gen3/fuzz_directory/input_corpus -o fuzz_directory/output -- /home/sbigdeli/Desktop/LIA2/rdswf-lund-lia-gen3/bazel-bin/fuzz_directory/fuzz