import 'package:flutter/material.dart';
import '../mixins/validationMixins.dart';

class LoginStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginStateful> with ValidationMixin {
  // Weird but if you add the type reset() doesn't get recognized
  final formKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passowrdField(),
            Container(margin: EdgeInsets.only(bottom: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration:
          InputDecoration(hintText: 'Enter email address', labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        email = value;
        print('Gonna save $value');
      },
    );
  }

  Widget passowrdField() {
    return TextFormField(
      decoration:
          InputDecoration(hintText: 'Enter password', labelText: 'Password'),
      obscureText: false,
      validator: validatePassword,
      onSaved: (value) {
        password = value;
        print('Gonna save password: $value');
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Submit Email: $email, password: $password');
        } else {
          print('Not freakin valid man!');
        }
      },
    );
  }
}
