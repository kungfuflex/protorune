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
    equals: async (amounts: bigint[]) => {
      const resBalances = (await result).balanceSheet;
      expect(resBalances.length).equals(
        amounts.length,
        `address ${index} did not have any balances`,
      );
      for (let i = 0; i < amounts.length; i++) {
        expect(resBalances[i].balance).equals(
          amounts[i],
          `address ${index} did not have the expected balance`,
        );
      }
    },
    isZero: async () => {
      // its possible for a protorune to have a balancesheet, but it was decremented to 0
      const resBalances = (await result).balanceSheet;
      if (resBalances.length !== 0) {
        expect(Number(resBalances[0].balance)).equals(
          0,
          `address ${index} should not have any runes left`,
        );
      } else {
        expect(resBalances.length).equals(
          0,
          `address ${index} should not have any runes left, has length`,
        );
      }
    },
  };
}
