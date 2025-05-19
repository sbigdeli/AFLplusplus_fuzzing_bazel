# Fuzzing Tool Comparison: AFL++, Honggfuzz, and LibFuzzer

## 1. Supported Compilers

### AFL++
- **Supports**: Supports both Clang and GCC, for optimal fuzzing use specific compilers like afl-clang-fast and afl-gcc-fast.
- **Pros**: Excellent support for both compilers with advanced features.
- **Cons**: Requires proper setup and configuration.

### Honggfuzz
- **Supports**: Clang and GCC (more commonly used with Clang).
- **Pros**: Supports multiple compilers.
- **Cons**: Less documentation for GCC-specific setups.

### LibFuzzer
- **Supports**: Primarily optimized for Clang.
- **Pros**: Seamless Clang integration.
- **Cons**: Requires more setup for GCC.

## 2. Speed and Performance

### AFL++
- **Speed**: Persistent mode improves speed significantly.
- **Pros**: Faster fuzzing with persistent mode.
- **Cons**: Needs optimization for high-load scenarios.

### Honggfuzz
- **Speed**: Fast in some scenarios due to optimizations.
- **Pros**: Good speed in some cases.
- **Cons**: Performance varies based on configuration.

### LibFuzzer
- **Speed**: Extremely fast with in-process fuzzing.
- **Pros**: Low overhead, fast fuzzing.
- **Cons**: Limited parallelization across multiple machines.

## 3. Documentation and Community Support

### AFL++
- **Documentation**: Comprehensive and detailed.
- **Community**: Strong GitHub presence with active support.
- **Pros**: Extensive resources for beginners and advanced users.
- **Cons**: Some advanced features lack detailed documentation.

### Honggfuzz
- **Documentation**: Basic but usable.
- **Community**: Smaller community.
- **Pros**: Dedicated user base.
- **Cons**: Limited documentation, harder for beginners.

### LibFuzzer
- **Documentation**: Extensive, detailed, and well-maintained by LLVM.
- **Community**: Strong LLVM support.
- **Pros**: Well-documented with solid community support.
- **Cons**: Can be challenging for beginners.

## 5. Fuzzing Harness

- **AFL++**: No harness required for most use cases, can implement if needed. See: rdswf-lund-lia-gen3/fuzz_directory/src/hash_fuzz_target.cpp
- **Honggfuzz**: No harness needed for simple cases, but beneficial for complex ones.
- **LibFuzzer**: Requires a custom harness for integration with the codebase.

## 6. Summary

We chose AFL++ over libFuzzer and Honggfuzz because of its ability to handle both in-process and out-of-process fuzzing without requiring significant modifications to the code. One of AFL++'s key strengths is its persistent mode, which significantly boosts fuzzing speed by reducing overhead. Additionally, its support for parallel and distributed fuzzing allows it to scale effectively across multiple machines or CPU cores.
 
While Honggfuzz supports multi-threaded fuzzing, AFL++'s parallel execution model is better optimized for distributed environments. Honggfuzz is more focused on single-machine rather than multi-machine. Another drawback of Honggfuzz is the documentation, a less user-friendly interface, a smaller community, and a setup process that requires more manual configuration. These factors made it less suitable for our needs compared to AFL++. Libfuzzer does not offer the same scalability for large distributed fuzzing tasks. AFL++ offers the most comprehensive and flexible solution for large-scale fuzzing tasks. Its support for a wide variety of fuzzing scenarios—ranging from simple in-process fuzzing to distributed, stateful, and persistent fuzzing.
 
The original authors of libFuzzer have stopped active work on it and switched to working on another fuzzing engine, Centipede. Libfuzzer is still maintained for critical bug fixes. But because of this, the communtity may shrink over time compared to AFL++.
See documentation: https://llvm.org/docs/LibFuzzer.html#status

AFL++ on the otherhand has got a great community with good activity and many contributors.
See Github: https://github.com/AFLplusplus/AFLplusplus/activity

## Links
https://github.com/AFLplusplus/AFLplusplus/blob/stable/instrumentation/README.persistent_mode.md

https://aflplus.plus/

https://aflplus.plus/docs/parallel_fuzzing/ 