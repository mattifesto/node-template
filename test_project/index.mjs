import { add } from "test-library";

let result = add(1, 2);
let expectedResult = 3;

if (result !== expectedResult) {
    throw new Error(`1 + 2 should equal 3, actual result was ${result}`);
}
