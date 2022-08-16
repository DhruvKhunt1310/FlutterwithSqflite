import 'package:book11/model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'insertpage.dart';

void main() {
  runApp(MaterialApp(
    home: viewpage(),
  ));
}

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  @override
  initState() {
    super.initState();
    get();
    setState((){});
  }

  late Widget l;
  Database? db;
  List<Map> list = [];

  get() {
    DbHelper dbhelper = DbHelper();
    dbhelper.createfolder().then((value) async {
      db = value;

      String qry = 'SELECT * FROM Test';
      list = await db!.rawQuery(qry);
l= ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
Map map=list[index];
      return ListTile(
        leading: Icon(Icons.list_rounded),
        trailing: Icon(Icons.more_vert),
        title: Text('${map['name']}'),
        subtitle: Text('${map['sernam']}'),
      );
    });
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('viewpage'),
      ),
      body:l,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return insertpage();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
