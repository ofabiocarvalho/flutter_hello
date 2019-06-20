import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: 300,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
              accountName: Text("Fabio Carvalho"),
               accountEmail: Text("ofabiocarvalho@gmail.com"),
               currentAccountPicture: CircleAvatar(
                 backgroundImage: NetworkImage("http://www.iconninja.com/files/553/986/399/face-avatar-icon.png") ,
                 backgroundColor: Colors.white,
               ),
          ),
              ListTile(
                onTap: () {
                  print("Item 1");
                },
                title: Text("Item 1"),
                subtitle: Text("Mais informações...."),
                leading: Icon(Icons.star),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  print("Item 2");
                },
                title: Text("Item 2"),
                subtitle: Text("Mais informações...."),
                leading: Icon(Icons.star),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  print("Item 3");
                },
                title: Text("Item 3"),
                subtitle: Text("Mais informações...."),
                leading: Icon(Icons.star),
                trailing: Icon(Icons.arrow_forward),
              )
            ],
          )),
    );
  }
}
