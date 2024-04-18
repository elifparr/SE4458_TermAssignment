import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> dropdownItems = [];

  bool _isChecked = false;
  bool _isDataLoaded = false; // Track if data is already loaded

  // Fetch data from API
  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://countryapi.io/api/all?apikey=aS1al1HfQcsB1BXmszdSvjlnzJMo54RcGNbqD2Zg'));

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data = jsonDecode(response.body);

        if (data != null) {
          final List<dynamic> countryDataList = data.values.toList();

          dropdownItems = countryDataList
              .map<String>((countryData) => countryData['name'] as String)
              .toList();

          // Set _isDataLoaded to true after data is fetched
          setState(() {
            _isDataLoaded = true;
          });
        } else {
          throw Exception('Response data is null');
        }
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Call fetchData() only once in initState()
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Text('Sign Up page'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
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
          child: _isDataLoaded
              ? SingleChildScrollView(
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
                              'https://cdn-icons-png.flaticon.com/512/4018/4018431.png'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your name',
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
                          'Surname',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your surname',
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
                          'Country',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DropdownButtonFormField<String>(
                              hint: Text('Select your country'),
                              items: dropdownItems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                // Handle dropdown item selection
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please fill out this field!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value ?? false;
                                    });
                                  },
                                ),
                                Text('I agree to the terms and conditions.'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Processing Data...'),
                                  ),
                                );
                                Future.delayed(Duration(seconds: 1), () {
                                  // Process data here
                                  // For demonstration, I'm printing a message after a delay
                                  print('Data processed!');
                                });
                              },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
