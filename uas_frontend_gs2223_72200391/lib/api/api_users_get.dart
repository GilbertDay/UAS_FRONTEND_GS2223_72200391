// ignore_for_file: implementation_imports

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_users_get extends StatefulWidget {
  const Api_users_get({super.key});

  @override
  State<Api_users_get> createState() => _Api_comments_getState();
}

class _Api_comments_getState extends State<Api_users_get> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataUsers();
  }

  Future _getDataUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _get.clear();
          _get = data;
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('GET USER')),
        body: RefreshIndicator(
          onRefresh: _getDataUsers,
          child: ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      title: Text(_get[index]['name']),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                );
              }),
        ));
  }
}
// Card(
//         child: ListTile(
//           title: Text(_get[index]['title']),
//           trailing: Icon(Icons.more_vert),
//         ),
//       ),