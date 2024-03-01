import { Box } from "../utils/box";
import { parsePrimitive, parseLenThenBytes, parseVarInt } from "../utils/utils";
import { toPointer, nullptr } from "../utils/pointer";

export class WitnessPart {
  public bytes: Box;
  public firstByte: u8;
  public isScript: boolean;
  public taprootAnnex: boolean

  constructor(data: Box) {
    this.bytes = parseLenThenBytes(data);
    this.firstByte = parsePrimitive<u8>(this.bytes.sliceFrom(0));

    // check first byte of witness part
    // determines if part is a script or has taproot annex byte (0x50)
    switch (this.firstByte) {
      case 0x50:
        this.taprootAnnex = true;
        this.isScript = false;
        break;
      case 0x30:
        this.isScript = false;
        this.taprootAnnex = false;
        break;
      default: 
        this.taprootAnnex = false;
        this.isScript = true;
    }

    if (this.bytes.len <= 1) {
      this.isScript = false;
    }
  }
}

export class Witness {
  public bytes: Box;
  public parts: Array<WitnessPart>;

  constructor(data: Box) {
    this.bytes = nullptr<Box>();
    const head: usize = data.start;
    const len = <i32>parseVarInt(data);
    this.parts = new Array<WitnessPart>(len);
    for (let i = 0; i < len; i++) {
      this.parts[i] = new WitnessPart(data);
    }
    const tail: usize = data.start;
    this.bytes = toPointer(head).toBox(tail - head)
  }

  taprootAnnex(): boolean { 
    if (this.parts.length >= 2) {
      return this.parts[this.parts.length - 1].taprootAnnex;
    }
    return false;
  }

  // get tapscript following rules in BIP341 
  // [ref](https://github.com/bitcoin/bips/blob/master/bip-0341.mediawiki)
  tapscript(): Box {
    var len = this.parts.length;
    var script: Box = nullptr<Box>();
    // fail if witness stack is empty 
    if (len == 0) {
      return nullptr<Box>(); 
    }

    if (len >= 2 ) {
      let m: Array<WitnessPart>;
      // check for taproot annex
      if (this.parts[len - 1].taprootAnnex) {
        m = this.parts.slice(0, len - 1);
      } else {
        m = this.parts.slice(0);
      }

      let mLen = m.length;

      // keypath spend
      // TODO: validate the remaining signature
      if (mLen == 1) return nullptr<Box>();

      if (mLen >= 2) {
        // if this is a signature
        if (m[mLen - 2].isScript != true) return script;

        let control = m[mLen - 1].bytes;
        if (control.len < 33 || (control.len - 33) % 32 != 0) return script;

        // return copy so it can be parsed;
        script = m[mLen - 2].bytes.sliceFrom(0);
        return script;
      }
      return script;
    } else {
      return script;
    }
  }
}
