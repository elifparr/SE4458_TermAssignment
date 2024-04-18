import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart'; 
import 'package:http/http.dart' as http;
import 'signin.dart'; 

void main() {
  runApp(MaterialApp(
    home: WelcomePage(),
  ));
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Text(''), 
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      'https://www.kindpng.com/picc/m/465-4654006_e-commerce-icon-illustration-hd-png-download.png')),
              Text(
                'Welcome to Shopistan!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey[800],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                  onPressed: () {
                    print('');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  child: Text('Sign In'),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                  onPressed: () {
                    print('');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()), // Replaced SignUpPage() with SignUpPage
                    );
                  },
                  child: Text('Sign Up'),
                ),
              ),
              Container(
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
