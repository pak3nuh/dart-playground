import 'conditional_import.dart' as twitter;

void main() {
  twitter.instance.post(twitter.greet + ' cenas');
}
