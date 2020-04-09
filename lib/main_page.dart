import 'package:TodoApp/login.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "TodoApp",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
    );
  }
}
