"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.stripHexPrefix = void 0;
const stripHexPrefix = (s) => s.slice(0, 2) == "0x" ? s.slice(2) : s;
exports.stripHexPrefix = stripHexPrefix;
//# sourceMappingURL=index.js.map