import 'package:flutter/material.dart';
import 'screens/scoped_login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log me in',
        home: Scaffold(
          appBar: AppBar(title: Text('Login')),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
