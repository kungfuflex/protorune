var { decodeList, padLeft } = require('./lib/protostone');

var decodeListHex = (s) => decodeList(Buffer.from(s, 'hex'))
var decodeListBigInt = (n) => decodeListHex(padLeft(n.toString(16)));
var getProtostones = (hex) => decodeListHex(hex).reduce((() => {
  let terminated = false;
  return (r, v, i, ary) => {
    if (terminated) return r;
    if (i % 2 === 0) {
      if (v === 16383n) {
        return r + padLeft(ary[i + 1].toString(16));
      }
      if (v === 0n) terminated = true;
    }
    return r;
  }
})());

