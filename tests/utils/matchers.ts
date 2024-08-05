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
        `address ${index} was not refunded runes`,
      );
    },
    isZero: async () => {
      expect((await result).balanceSheet.length).equals(
        0,
        `address ${index} should not have any runes left`,
      );
    },
  };
}
