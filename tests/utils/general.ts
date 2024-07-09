import path from "path";
import fs from "node:fs";

function findRootDir(currentDir: string): string {
  const parentDir = path.resolve(currentDir, "..");

  if (fs.existsSync(path.join(currentDir, "package.json"))) {
    return currentDir;
  } else if (currentDir === parentDir) {
    // If we reach the root directory of the file system, throw an error.
    throw new Error("Root directory not found");
  } else {
    // Recur with the parent directory.
    return findRootDir(parentDir);
  }
}

export const DEBUG_WASM = fs.readFileSync(
  path.join(findRootDir(__dirname), "build", "debug.wasm"),
);
