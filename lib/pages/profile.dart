import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1307076475631611905/1h8uA-Ok_400x400.jpg',
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${box.read("name")}',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 8),
            Text(
              'Freelance Developer',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('5'),
                    Text('Projets terminés'),
                  ],
                ),
                Column(
                  children: [
                    Text('4.8'),
                    Text('Note moyenne'),
                  ],
                ),
                Column(
                  children: [
                    Text('3'),
                    Text('Projets en cours'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Description',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8),
            Text(
              'Je suis un développeur indépendant passionné par le développement d\'applications mobiles et de sites web. Je m\'efforce de livrer des projets de qualité à mes clients en utilisant les dernières technologies et en suivant les meilleures pratiques de développement.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
