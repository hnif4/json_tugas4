import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('DKI JAKARTA "OPEN DATA"'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.landscape), text: 'Welcome'),
              Tab(icon: Icon(Icons.tour), text: 'Pariwisata'),
              Tab(icon: Icon(Icons.health_and_safety), text: 'Kesehatan'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WelcomeTab(),
            PariwisataTab(),
            KesehatanTab(),
            ProfileTab(),
          ],
        ),
      ),
    );
  }
}

class WelcomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("WELCOME TO DKI JAKARTA OPEN DATA"),
    );
  }
}

class PariwisataTab extends StatelessWidget {
  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pariwisata List'),
      ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.firstName),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}

class User {
  final String firstName;
  final String email;
  User({required this.firstName, required this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      email: json['email'],
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("SAYA HANI"),
    );
  }
}

class KesehatanTab extends StatelessWidget {
  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesehatan List'),
      ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.firstName),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}

class User1 {
  final String firstName;
  final String email;
  User1({required this.firstName, required this.email});
  factory User1.fromJson(Map<String, dynamic> json) {
    return User1(
      firstName: json['first_name'],
      email: json['email'],
    );
  }
}
