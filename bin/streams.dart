void main() async {
  final stream1 = getStream(0, 10);
  final stream2 = getStream(5, 50);
  final list = await concatByYield(stream2, stream1).toList();
  print(list);
}

Stream<int> getStream(int from, int to) async* {
  for (var x = from; x < to; x++) {
    yield x;
  }
}

Stream<int> concatByYield(Stream<int> left, Stream<int> right) async* {
  yield* left;
  yield* right;
}
