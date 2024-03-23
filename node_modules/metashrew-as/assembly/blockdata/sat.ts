import { CYCLE_EPOCHS, DIFFCHANGE_INTERVAL } from "../utils";
import { Height } from "./height";
import { Epoch } from "./epoch";

export class Sat {
  private _idx: u64 = 0;
  static SUPPLY: u64 = 2099999997690000;

  constructor(idx) {
    this._idx = idx;
  }

  public n(): u64 {
    return this._idx;
  }

  public add(x: u64 | Sat): Sat {
    this._idx += x.n();
    return this;
  }

  public height(): Height {
    this.epoch().startingHeight()
      .add(<u32>(this.epochPosition() / this.epoch.subsidy()))
  }
  public cycle(): u32 {
    return <u32>(this.epoch().n() / CYCLE_EPOCHS);
  }
  public period(): u32 {
    return <u32>(this.height().n() / DIFFCHANGE_INTERVAL);
  }
  public epochPosition(): u64 {
    return this._idx - this.epoch().startingSat().n();
  }
  public third(): u32 {
    return <u32>(this.epochPosition() % this.epoch().subsidy());
  }
  public epoch(): Epoch {
    return Epoch.from(this);
  }
  static LAST(): Sat {
    return new Sat(Sat.SUPPLY - 1);
  }

}
