void main() {
  /*
  * With every mixin application, a new class is created that applies
  * the mixin on top of the applied class.
  * The supper keyword references the class it is being applied on!
  *
  * +--------------------+
  * | B                  | super references A
  * |+------------------+|
  * || A                || super references Base
  * ||+----------------+||
  * ||| AImpl -> Base  ||| super references B
  * ||+----------------+||
  * |+------------------+|
  * +--------------------+
  * */
  print("Result A first: ${AImpl().build()}");
  print("");
  print("Result B first: ${BImpl().build()}");
}

abstract class Base {
  String build() {
    print("Build Base");
    return "Base";
  }
}

mixin A on Base {
  @override
  String build() {
    super.build();
    print("Build A");
    return "A";
  }
}

mixin B on Base {
  @override
  String build() {
    super.build();
    print("Build B");
    return "B";
  }
}

class AImpl extends Base with A, B {
  @override
  String build() {
    final build = super.build();
    print("Build Aimpl");
    return build;
  }
}

class BImpl extends Base with B, A {}
