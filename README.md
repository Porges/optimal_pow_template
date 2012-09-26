optimal_pow_template
====================

C++ template for generating optimal exponentiation chains (sort of by accident).

Compile with something like:

    g++-4.7 -std=c+=11 pow.cpp -O2 -ftemplate-depth=9000 (-masm=intel -S)
