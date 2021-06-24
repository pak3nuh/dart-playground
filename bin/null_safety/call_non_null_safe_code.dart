import 'unsound_null_safety.dart';

void main() {
  // will work if run with the switch --no-sound-null-safety
  // switch also available in flutter
  int nullable = getNull();
  print(nullable);
  // print(nullable.floor()); would break
}
