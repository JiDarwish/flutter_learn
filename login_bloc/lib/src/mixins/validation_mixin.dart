import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (String email, EventSink sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Email is not valid!');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (String password, EventSink sink) {
    if (password.length > 6) {
      sink.add(password);
    } else {
      sink.addError('Password is not long enough!');
    }
  });
}
