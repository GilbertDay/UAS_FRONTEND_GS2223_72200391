// ignore_for_file: implementation_imports

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_photos_get extends StatefulWidget {
  const Api_photos_get({super.key});

  @override
  State<Api_photos_get> createState() => _Api_comments_getState();
}

class _Api_comments_getState extends State<Api_photos_get> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataPhotos();
  }

  Future _getDataPhotos() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

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
        appBar: AppBar(title: Text('GET PHOTOS')),
        body: RefreshIndicator(
          onRefresh: _getDataPhotos,
          child: ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      leading: FittedBox(
                          child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(_get[index]['url'].toString()),
                      )),
                      title: Text(_get[index]['title']),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                );
              }),
        ));
  }
}
