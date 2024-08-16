export declare function expectBalances(program: any, address: string, index: number, method: (...args: any) => Promise<any>, ...args: any): {
    equals: (amount: bigint) => Promise<void>;
    isZero: () => Promise<void>;
};
