"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.expectBalances = expectBalances;
const chai_1 = require("chai");
function expectBalances(program, address, index, method, ...args) {
    const result = method(program, address, ...args);
    return {
        equals: async (amount) => {
            (0, chai_1.expect)((await result).balanceSheet[0].balance).equals(amount, `address ${index} did not have the expected balance`);
        },
        isZero: async () => {
            // its possible for a protorune to have a balancesheet, but it was decremented to 0
            const resBalances = (await result).balanceSheet;
            (0, chai_1.expect)(resBalances.length == 0 || resBalances[0].balance == 0).equals(true, `address ${index} should not have any runes left`);
        },
    };
}
//# sourceMappingURL=matchers.js.map