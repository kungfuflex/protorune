import { ProtoBurn as ProtoBurnLayout } from "./proto/protorune";
import {
  MAX_SCRIPT_ELEMENT_SIZE,
  OP_RETURN,
} from "@magiceden-oss/runestone-lib/dist/src/constants";
import { script } from "@magiceden-oss/runestone-lib/dist/src/script";

export class ProtoBurn implements ProtoBurnLayout {
  protocolTag: Uint8Array;
  pointer: number;

  constructor(obj: ProtoBurnLayout) {
    this.protocolTag = obj.protocolTag;
    this.pointer = obj.pointer;
  }

  encipher() {
    const stack: (Buffer | number)[] = [];
    const payload = Buffer.from(ProtoBurnLayout.toBinary(this));

    stack.push(OP_RETURN);
    stack.push(OP_RETURN);

    for (let i = 0; i < payload.length; i += MAX_SCRIPT_ELEMENT_SIZE) {
      stack.push(payload.subarray(i, i + MAX_SCRIPT_ELEMENT_SIZE));
    }

    return script.compile(stack);
  }
}
