# Conditional imports

Every `export` keyword creates a library that can be imported with `import`.

Dart allows exports to be conditional based on other libraries present on compilation phase.

```dart
export 'interfaces.dart'
if (dart.library.io) 'io_twitter.dart'
if (dart.library.js) 'js_twitter.dart';
```

Every used inside `interfaces` file must be present in the implementation file or else compilation will fail. In essence
the `interfaces` is just to keep the analyzer happy when we code against the API because in practice the file is swapped
with the correct one at compilation time. **That is why IDE's don't flag missing definitions**