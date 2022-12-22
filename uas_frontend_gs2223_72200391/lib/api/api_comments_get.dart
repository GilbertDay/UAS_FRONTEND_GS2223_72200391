// ignore_for_file: implementation_imports

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_comments_get extends StatefulWidget {
  const Api_comments_get({super.key});

  @override
  State<Api_comments_get> createState() => _Api_comments_getState();
}

class _Api_comments_getState extends State<Api_comments_get> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataComments();
  }

  Future _getDataComments() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

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
        appBar: AppBar(title: Text('GET COMMENTS')),
        body: RefreshIndicator(
          onRefresh: _getDataComments,
          child: ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(_get[index]['name']),
                    subtitle: Text(_get[index]['email']),
                    trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            )
                          ];
                        }),
                  ),
                );
              }),
        ));
  }
}
