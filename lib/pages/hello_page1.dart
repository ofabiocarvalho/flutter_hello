import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter Hello",
          ),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context, "Clicou no voltar");
              },
              child: Text(
                "Page 1",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
            )
        )
    );
  }
}