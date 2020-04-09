import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 80),
              Image.network(
                  'https://cdn.pixabay.com/photo/2020/03/31/05/41/phone-4986359__340.jpg'),
              SizedBox(height: 20),
              Text(
                'Todo',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _usernameController,
                decoration:
                    InputDecoration(filled: true, labelText: 'Username'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                obscureText:true,
                controller: _passwordController,
                decoration:
                    InputDecoration(filled: true, labelText: 'Password'),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: (){
                      print(_usernameController.text);
                      print(_passwordController.text);
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                  ),
                  SizedBox(width: 8.0,),
                  RaisedButton(
                    child: Text("NEXT"),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
