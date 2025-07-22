import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreen();
}

class _UserProfileScreen extends State<UserProfileScreen> {

  var data;
  Future<void> getUserApi () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode ==200)  {
        data = jsonDecode(response.body.toString());
    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(child:
          FutureBuilder(future: getUserApi (),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: (Text("loading")));
                }
                else {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                    return Card(
                      child: Column(
                        children: [
                          ReuseableRow(title: 'Name', value: data[index]['name'].toString(),),
                          ReuseableRow(title: 'Username', value: data[index]['username'].toString(),),
                          ReuseableRow(title: 'Email', value: data[index]['email'].toString(),),
                          ReuseableRow(title: 'Lat', value: data[index]['address']['geo']['lat'],)
                          
                        ],
                      ),
                    );
                  });
                }
              }))
        ],
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {
  String title, value;
   ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text(title),
            Text(value),
        ],
      ),
    );
  }
}
