
export const stripHexPrefix = (s) => s.substr(0, 2) === '0x' ? s.substr(2) : s;
export const addHexPrefix = (s) => '0x' + stripHexPrefix(s);
