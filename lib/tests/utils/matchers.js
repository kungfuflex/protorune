"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.expectBalances = expectBalances;
const chai_1 = require("chai");
function expectBalances(program, address, index, method, ...args) {
    const result = method(program, address, ...args);
    return {
        equals: async (amount) => {
            (0, chai_1.expect)((await result).balanceSheet[0].balance).equals(amount, `address ${index} was not refunded runes`);
        },
        isZero: async () => {
            (0, chai_1.expect)((await result).balanceSheet.length).equals(0, `address ${index} should not have any runes left`);
        },
    };
}
//# sourceMappingURL=matchers.js.map