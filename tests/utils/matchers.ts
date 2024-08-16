import { expect } from "chai";
export function expectBalances(
  program: any,
  address: string,
  index: number,
  method: (...args: any) => Promise<any>,
  ...args: any
) {
  const result = method(program, address, ...args);
  return {
    equals: async (amount: bigint) => {
      expect((await result).balanceSheet[0].balance).equals(
        amount,
        `address ${index} did not have the expected balance`,
      );
    },
    isZero: async () => {
      // its possible for a protorune to have a balancesheet, but it was decremented to 0
      const resBalances = (await result).balanceSheet;
      expect(resBalances.length == 0 || resBalances[0].balance == 0).equals(
        true,
        `address ${index} should not have any runes left`,
      );
    },
  };
}
