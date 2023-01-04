import 'package:flutter/material.dart';
import 'package:footic/pages/home.dart';
import 'package:footic/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Entrez votre adresse e-mail';
                }
                return null;
              },
              onSaved: (input) => _email = input!,
              decoration: InputDecoration(labelText: 'Adresse e-mail'),
            ),
            TextFormField(
              validator: (input) {
                if (input!.length < 6) {
                  return 'Entrez un mot de passe valide';
                }
                return null;
              },
              onSaved: (input) => _password = input!,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Connexion'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => SignupPage()),
                        (Route<dynamic> route) => false
                );
              },
              child: Text('Vous n\'avez pas de compte? Inscrivez-vous'),
            )
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Appeler l'API de connexion ici
      print(_email);
      print(_password);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
              (Route<dynamic> route) => false
      );
    }
  }
}
