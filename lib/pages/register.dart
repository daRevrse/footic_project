import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _email, _password;

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
                  return 'Entrez votre nom';
                }
                return null;
              },
              onSaved: (input) => _name = input!,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
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
              child: Text('S\'inscrire'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                        (Route<dynamic> route) => false
                );
              },
              child: Text('Vous avez déjà un compte? Connectez-vous'),
            )

          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Appeler l'API d'inscription ici
      print(_name);
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
