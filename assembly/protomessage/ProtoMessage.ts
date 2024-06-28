export class ProtoMessage {
  static handle<T>(context: T): void {
    //@ts-ignore
    context.handle();
  }
}
