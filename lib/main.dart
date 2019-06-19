import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/hello_listview.dart';
import 'package:flutter_hello/pages/hello_page2.dart';
import 'package:flutter_hello/pages/hello_page3.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _msg = "Hello World";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Hello",
        ),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        return _body(context);
      }),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("Page 1", () => _onClickPage1(HelloListView(context))),
            _button("Page 2", () => _onClickPage1(HelloPage2())),
            _button("Page 3", () => _onClickPage1(HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("Snack", () => _onClickSnack(context)),
            _button("Dialog", () => _onClickDialog(context)),
            _button("Toast", () => _onClickToast()),
          ],
        ),
      ],
    );
  }

  _pageView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: 300,
        child: PageView(
          children: <Widget>[
            _img("assets/images/antonio.jpg"),
            _img("assets/images/fabio.png"),
            _img("assets/images/raquel.jpg"),
            _img("assets/images/mauricio.jpg"),
            _img("assets/images/victor.jpg"),
          ],
        ),
      ),
    );
  }

  _text() {
    return Text(
      _msg,
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.contain,
    );
  }

  _button(String s, Function onPressed) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        s,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }

  _onClickOk(String s) {
    /*setState(() {
      _msg = s;
    });*/
  }

  _onClickPage1(Widget page) {
    Future<String> future =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));

    future.then((s) {
      if (s != null) {
        _msg = s;
      }
    });
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(label: "OK", onPressed: () {}),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Flutter é muito top"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
