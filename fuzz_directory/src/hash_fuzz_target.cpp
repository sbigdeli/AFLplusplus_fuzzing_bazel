#include <stdint.h>
#include <stddef.h>
#include <iostream>
#include "mathlib.h"
extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    if (size < 2) return 0;  
    int a = data[0];
    int b = data[1];
    try {
        int sum = MathLib::add(a, b);
        int difference = MathLib::subtract(a, b);
        int product = MathLib::multiply(a, b);
        double quotient = MathLib::divide(a, b);
        std::cerr << "Sum: " << sum << ", Difference: " << difference
                  << ", Product: " << product << ", Quotient: " << quotient << std::endl;
    } catch (const std::runtime_error& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        abort();
    }
    return 0;
}