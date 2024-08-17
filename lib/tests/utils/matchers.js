"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.expectBalances = expectBalances;
const chai_1 = require("chai");
function expectBalances(program, address, index, method, ...args) {
    const result = method(program, address, ...args);
    return {
        equals: async (amounts) => {
            const resBalances = (await result).balanceSheet;
            (0, chai_1.expect)(resBalances.length).equals(amounts.length, `address ${index} did not have any balances`);
            for (let i = 0; i < amounts.length; i++) {
                (0, chai_1.expect)(resBalances[i].balance).equals(amounts[i], `address ${index} did not have the expected balance`);
            }
        },
        isZero: async () => {
            // its possible for a protorune to have a balancesheet, but it was decremented to 0
            const resBalances = (await result).balanceSheet;
            if (resBalances.length !== 0) {
                (0, chai_1.expect)(Number(resBalances[0].balance)).equals(0, `address ${index} should not have any runes left`);
            }
            else {
                (0, chai_1.expect)(resBalances.length).equals(0, `address ${index} should not have any runes left, has length`);
            }
        },
    };
}
//# sourceMappingURL=matchers.js.map