import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

final owner = "";

void main() async {
  final wsUrl = "";
  final stompUrl = "wss://$wsUrl";

  final client = StompClient(
      config: StompConfig(
    url: stompUrl,
    onConnect: _subscribe,
    onStompError: _printError,
    onWebSocketError: _printError,
    onDebugMessage: print,
  ));

  print("Activating");
  client.activate();

  await Future.delayed(Duration(hours: 1));
  client.deactivate();
  print("Exiting");
}

void _subscribe(StompClient client, StompFrame frame) {
  print("STOMP Connected");
  client.subscribe(destination: "/kafka/topic/$owner", callback: _printBody);
}

void _printBody(StompFrame frame) {
  print("Message arrived");
  print(frame.body);
}

void _printError(Object p1) {
  print("Error");
  print(p1.toString());
}

void _onWebsocketDone() {
  print("Websocket done");
}
