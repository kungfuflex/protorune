import {
  MAX_SCRIPT_ELEMENT_SIZE,
  OP_RETURN,
} from "@magiceden-oss/runestone-lib/dist/src/constants";
import { script } from "@magiceden-oss/runestone-lib/dist/src/script";
import { u128, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Tag } from "./tag";
import { Some, Option } from "@magiceden-oss/runestone-lib/dist/src/monads";

export class ProtoBurn {
  protocolTag: Option<u128>;
  pointer: Option<u32>;

  constructor(obj: { protocolTag: bigint; pointer: number }) {
    this.protocolTag = Some<u128>(u128(obj.protocolTag));
    this.pointer = Some<u32>(u32(obj.pointer));
  }

  encipher() {
    const stack: (Buffer | number)[] = [];
    let payloads: Buffer[] = [];
    console.log(this.protocolTag.unwrap());
    payloads.push(Tag.encodeOptionInt(Tag.POINTER, this.pointer.map(u128)));
    payloads.push(Tag.encodeOptionInt(Tag.BURN, this.protocolTag.map(u128)));
    stack.push(OP_RETURN);
    stack.push(OP_RETURN);
    const payload = Buffer.concat(payloads);
    for (let i = 0; i < payload.length; i += MAX_SCRIPT_ELEMENT_SIZE) {
      stack.push(payload.subarray(i, i + MAX_SCRIPT_ELEMENT_SIZE));
    }

    return script.compile(stack);
  }
}
