"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.DEBUG_WASM = void 0;
const path_1 = __importDefault(require("path"));
const node_fs_1 = __importDefault(require("node:fs"));
function findRootDir(currentDir) {
    const parentDir = path_1.default.resolve(currentDir, "..");
    if (node_fs_1.default.existsSync(path_1.default.join(currentDir, "package.json"))) {
        return currentDir;
    }
    else if (currentDir === parentDir) {
        // If we reach the root directory of the file system, throw an error.
        throw new Error("Root directory not found");
    }
    else {
        // Recur with the parent directory.
        return findRootDir(parentDir);
    }
}
exports.DEBUG_WASM = node_fs_1.default.readFileSync(path_1.default.join(findRootDir(__dirname), "build", "debug.wasm"));
//# sourceMappingURL=general.js.map