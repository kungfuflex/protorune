"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.bufferToU128Array = void 0;
const u128_1 = require("@magiceden-oss/runestone-lib/dist/src/integer/u128");
const bufferToU128Array = (b) => {
    const ary = Uint8Array.from(b);
    const res = [];
    for (let i = 0; i < ary.byteLength; i += 16) {
        const last = i + 16;
        res.push((0, u128_1.u128)(BigInt(`0x${Buffer.from(ary.slice(i, last > ary.byteLength ? ary.byteLength : last)).toString("hex")}`)));
    }
    return res;
};
exports.bufferToU128Array = bufferToU128Array;
//# sourceMappingURL=buffer.js.map