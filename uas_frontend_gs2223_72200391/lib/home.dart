import 'package:flutter/material.dart';
import 'package:uas_frontend_gs2223_72200391/api/api_comments_get.dart';
import 'package:uas_frontend_gs2223_72200391/api/api_photos_get.dart';
import 'package:uas_frontend_gs2223_72200391/api/api_post_get.dart';
import 'package:uas_frontend_gs2223_72200391/api/api_users_get.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png'),
                ),
                accountName: Text('Aplikasi UAS'),
                accountEmail: Text('Aplikasi GET Data')),
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('POSTS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Api_post_get()));
              },
            ),
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('COMMENTS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Api_comments_get()));
              },
            ),
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('PHOTOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Api_photos_get()));
              },
            ),
            ListTile(
              title: const Text('USERS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Api_users_get()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
