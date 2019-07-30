import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../mixins/validation_mixin.dart';

class Bloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>(); // streamcontroller
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  // Stream
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  submit() {
    String email = _emailController.value;
    String password = _passwordController.value;

    print('submitting email: $email, password:$password');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

// Only needed for the global bloc thing
final bloc = Bloc();

/*
For clarification purposes


void main() {
  final controller = StreamController();
  
  controller.sink.add('Hi');
  controller.sink.add('Bye');
  
  controller.stream
    .map((val) => val.toLowerCase())
    .transform(
    StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      if (data == 'hi') {
        sink.add(data);
      } else {
        sink.addError('Its not a hi');
      }
    }
  )
  )
    .listen(
    (aHi) => print('Someone said $aHi'),
    onError: (err) => print('There was an error: $err')
  );
  */
