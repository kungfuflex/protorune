import { Epoch } from "./epoch";

export class Height {
  private _idx: u32;
  constructor(idx: u32) {
    this._idx = idx;
  }
  public n(): u32 {
    return this._idx;
  }
  public subsidy(): u64 {
    return Epoch.from(this).subsidy();
  }
  public startingSat(): Sat {
    let startingSat = Epoch.from(this).startingSat();
    let startingHeight = Epoch.from(this).startingHeight();
    return startingSat.add(<u64>(this.n() - startingHeight.n()) * Epoch.from(this).subsidy());
  }
  public add(x: u32): Height {
    this._idx += x;
    return this;
  }
}
