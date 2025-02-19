# VHDL Unsigned Multiplication Bug

This repository demonstrates a common error encountered when performing unsigned multiplication within a clocked process in VHDL. The bug arises from the implicit conversion and handling of unsigned values in the multiplication operation, leading to unexpected behavior or incorrect results.

## Bug Description
The `multiplier` entity performs an unsigned multiplication of two input vectors. However, the code lacks explicit overflow handling.  In certain cases (multiplication producing a result that exceeds the capacity of the `product` signal) this might result in silent truncation leading to incorrect results.

## Solution
The improved version includes explicit overflow detection and handling using additional signals to detect and report potential overflow conditions.  Alternatives might involve saturation arithmetic or more sophisticated error handling schemes depending on the application's requirements.