import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Text('Sign In Page'),
          actions: [
            IconButton(
              onPressed: () {
                // Navigate to the home page (main.dart)
                Navigator.pushReplacementNamed(context, '/'); // assuming '/' is your home route
              },
              icon: Icon(Icons.home),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        'https://static.thenounproject.com/png/994628-200.png',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Elif',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'elif@example.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Account'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Orders'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Contact us!'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 85,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/2847/2847017.png'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'E-mail',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your e-mail',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill out this field!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill out this field!';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Processing Data...'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
