import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Bienvenue sur votre plateforme de freelancing !',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 16),
            Text(
              'Vous trouverez ci-dessous vos projets en cours et terminés :',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Projet 1'),
                    subtitle: Text('Terminé'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Projet 2'),
                    subtitle: Text('Terminé'),
                  ),
                  ListTile(
                    leading: Icon(Icons.timer, color: Colors.orange),
                    title: Text('Projet 3'),
                    subtitle: Text('En cours'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Insérez ici le code pour ajouter un nouveau projet
        },
      ),
    );
  }
}
