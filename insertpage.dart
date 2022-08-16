import 'package:book11/main.dart';
import 'package:book11/model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class insertpage extends StatefulWidget {
  const insertpage({Key? key}) : super(key: key);

  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {
  TextEditingController iname = TextEditingController();
  TextEditingController isarnem = TextEditingController();

  Database? db;

  @override
  initState() {
    super.initState();
    DbHelper dbhelper = DbHelper();
    dbhelper.createfolder().then((value) {
      db = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insertpage'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: iname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'name',
                  hintText: 'name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: isarnem,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'sarnem',
                  hintText: 'sarnem'),
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              String qry =
                  'INSERT INTO Test(name,sernam) VALUES("${iname.text}","${isarnem.text}")';
              int i = await db!.rawInsert(qry);
              print('Rawinseertt=${i}');
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return viewpage();
                },
              ));
            },
            child: Text('save'),
          )
        ],
      ),
    );
  }
}
