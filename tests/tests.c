#include <cspecs/cspec.h>

context(example) {
    describe("This is an example test") {
        it("True should be true") {
            should_bool(true) be equal to(true);
        } end
    } end
}