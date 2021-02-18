Function CounterConstructor() {
  int counter = 0;
  void count() {
    counter++;
    print(counter);
  }

  return count;
}

abstract class WrongAdder {
  static WrongAdder _cache;
  final int val;
  int first;
  int second;
  int third;

  WrongAdder(this.val) {
    _cache = this;
  }

  factory WrongAdder.cached() {
    return _cache ?? Concrete(0);
  }
}

class Concrete extends WrongAdder {
  Concrete(int val) : super(val);
}

Stream<void> main() async* {
  try {
    print("before");
    return;
    var future = Future.microtask(() => throw '');
    var value = await future;
    print(value);
    yield null;
  } finally {}
}
