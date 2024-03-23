import { Box } from "../utils/box";
import { toPointer, nullptr, Pointer } from "../utils/pointer";
import { parsePushOp, decodeTag, concat } from "../utils/utils";

export class Field {
  public tag: u32;
  public data: ArrayBuffer;
  constructor(tag: u32, data: ArrayBuffer) {
    this.tag = tag;
    this.data = data;
  }
}


export class Inscription {
  bytes: Box;
  public fields: Array<Field>;
  constructor(data: Box) {
    this.bytes = nullptr<Box>();
    this.fields = new Array<Field>();
    const view = data.sliceFrom(0);

    let head = view.start;
    let len = view.len;
    let tail = view.start + len;

    // find the inscription
    while (head < (tail - 1)) {
      if (load<u8>(head) == 0x00 && load<u8>(head + 1) == 0x63) {
        head += 2;
        len -= 2;
        break;
      }
      head++;
      len--;
    }
    while (tail > head) {
      if (load<u8>(tail) == 0x68) break;
      tail--;
      len--;
    }
    let inscBox = toPointer(head).toBox(len);
    this.bytes = inscBox.sliceFrom(0);

    let ordTag = parsePushOp(inscBox);
    if (String.UTF8.decode(ordTag.toArrayBuffer()) !== "ord") {
      return this;
    }
    

    let tag: usize;
    let content = new Array<ArrayBuffer>();
    for (let i = parsePushOp(inscBox); inscBox.len > 0; i = parsePushOp(inscBox)) {
      if (decodeTag(i) >= 0x01 && decodeTag(i) <= 0x0b) {
          tag = decodeTag(i);
          this.fields.push(new Field(<u32>tag, parsePushOp(inscBox).toArrayBuffer()));
      } else if (decodeTag(i) == 0x00) {
        break;
      }
    }
    // handle content body pushes if data remains
    while (inscBox.len > 0) {
      let i = parsePushOp(inscBox);
      content.push(i.toArrayBuffer());
    }

    // fill out content body
    let contentBody: ArrayBuffer = concat(content);
    this.fields.push(new Field(<u32>0x00, contentBody));


  }
  toArrayBuffer(): ArrayBuffer {
    return this.fields.reduce((r: ArrayBuffer, v: Field, i: i32, ary: Array<Field>) => {
      return Box.concat([Box.from(r), Box.from(v.data)])
    }, new ArrayBuffer(0))
  }
}
