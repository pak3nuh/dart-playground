import 'dart:io';
import 'dart:async';
import 'dart:isolate';

// Static values are initialized in each Isolate. No shared memory
Counter counter = Counter();

Future<SendPort> initIsolate() {
  Completer completer = Completer<SendPort>();
  final isolateToMainStream = ReceivePort();

  isolateToMainStream.listen((data) {
    if (data is SendPort) {
      final mainToIsolateStream = data;
      completer.complete(mainToIsolateStream);
    } else {
      print(
          '[isolateToMainStream] $data with counter ${counter.incrementAndGet}');
    }
  });

  Isolate.spawn(myIsolate, isolateToMainStream.sendPort);
  return completer.future;
}

void myIsolate(SendPort isolateToMainStream) {
  final mainToIsolateStream = ReceivePort();
  isolateToMainStream.send(mainToIsolateStream.sendPort);

  mainToIsolateStream.listen((data) {
    print(
        '[mainToIsolateStream] $data with counter ${counter.incrementAndGet}');
    exit(0);
  });

  isolateToMainStream.send('This is from myIsolate()');
}

void main() async {
  final mainToIsolateStream = await initIsolate();
  mainToIsolateStream.send('This is from main()');
}

class Counter {
  int _value = 0;

  int get incrementAndGet => ++_value;
}
