import 'package:flutter/material.dart';

class HelloListView extends StatefulWidget {
  HelloListView(BuildContext context);

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  var _gridOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ListView & GridView",
          ),
          centerTitle: true,
          actions: _actions(),
        ),
        body: Container(color: Colors.white, child: _listView()));
  }

  _listView() {
    List<String> dogs = [
      "assets/images/antonio.jpg",
      "assets/images/fabio.png",
      "assets/images/raquel.jpg",
      "assets/images/mauricio.jpg",
      "assets/images/victor.jpg",
      "assets/images/antonio.jpg",
      "assets/images/fabio.png",
      "assets/images/raquel.jpg",
      "assets/images/mauricio.jpg",
      "assets/images/victor.jpg"
    ];

    return _gridOn
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              return _listItem(dogs, index);
            },
          )
        : ListView.builder(
            itemExtent: 250,
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              return _listItem(dogs, index);
            },
          );
  }

  Stack _listItem(List<String> dogs, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: _img(dogs[index]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            "Dog ${index + 1}",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        )
      ],
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _actions() {
    List<Widget> actions = [];

    if (_gridOn) {
      actions.add(IconButton(
        icon: Icon(Icons.list),
        onPressed: () {
          setState(() {
            _gridOn = false;
          });
        },
      ));
    } else {
      actions.add(IconButton(
        icon: Icon(Icons.grid_on),
        onPressed: () {
          setState(() {
            _gridOn = true;
          });
        },
      ));

      actions.add(IconButton(
        icon: Icon(Icons.favorite),
        onPressed: () {
          setState(() {
            _gridOn = true;
          });
        },
      ));
    }

    return actions;
  }
}
