import 'package:TodoApp/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:TodoApp/chatbox.dart';
import 'package:TodoApp/detail.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> with TickerProviderStateMixin {
  TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Text(
          "TodoApp",
          // style: GoogleFonts.montserrat(color: Colors.black, fontSize: 25.0),
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: <Widget>[
          Container(
            height: screenHeight / 3,
            width: screenWidth,
            child: Stack(
              children: <Widget>[
                Container(
                  width: screenWidth,
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2016/11/20/08/03/flowerpot-1842098_960_720.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 24,
                  left: 24,
                  child: Container(
                    height: 38,
                    margin: EdgeInsets.all(4.0),
                    padding: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _textController,
                      onSubmitted: _handleSubmitted,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.add, color: Colors.tealAccent),
                        hintText: "Todo",
                        hintStyle: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final _message = _messages[index];
                return Dismissible(
                  child: InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(text: _message.text)));
                  }, child: _message),
                  key: ObjectKey(_message),
                  onDismissed: (direction) {
                    print("dismissed: ${_message.text}");
                    if (_messages.contains(_message)) {
                      setState(() {
                        _messages.removeAt(index);
                      });
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "Message Deleted",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
