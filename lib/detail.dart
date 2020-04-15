import "package:flutter/material.dart";

class DetailPage extends StatelessWidget {
  final String text;

  DetailPage({this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Detail", style: TextStyle(color: Colors.black, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text(text, style: TextStyle(fontSize: 100)),
      )
    );
  }
}
