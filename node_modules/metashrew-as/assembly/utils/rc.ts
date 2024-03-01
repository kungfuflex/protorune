import { toPointer } from "./pointer";
import { Box } from "./box";

export class RCBox<T> extends Box {
  public link: T;
  constructor(link: T, start: Pointer<usize>, len: usize) {
    super(start, len);
    this.link = link;
  }
  static fromBox<T>(box: Box, link: T): RCBox<T> {
    return new RCBox<T>(link, box.start, box.len);
  }
}
