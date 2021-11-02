import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:flutter_widget/TransactionList.dart';

class layoutSafeArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _layout();
  }
}

class _layout extends State<layoutSafeArea> {
  List<String> list = [];
  String _name = "";
  int _age = 0;
  int index = 0;
  late DateTime _date=DateTime.now();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final List<Transaction> _list = [];
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Layout with SafeArea, Column, FlatButton and TextField",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello World!"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    this._insertTransaction();
                    _globalKey.currentState!.showSnackBar(SnackBar(
                      content: Text("${_list.length}"),
                      duration: Duration(milliseconds: 700),
                    ));
                  });
                },
                icon: Icon(Icons.add)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Add",
          onPressed: () {
            setState(() {
              this._insertTransaction();
            });
          },
          child: Icon(Icons.add),
        ),
        key: _globalKey,
        body: SingleChildScrollView(
          // minimum: const EdgeInsets.only(top: 30, right: 10, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      _name = text;
                    });
                  },
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: "Enter name: ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextField(
                  onChanged: (text) {
                    this.setState(() {
                      _age = int.tryParse(text)!;
                    });
                  },
                  controller: _ageController,
                  decoration: InputDecoration(
                      labelText: "Enter age: ",
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)))),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _insertTransaction();
                    });
                    // _globalKey.currentState!.showSnackBar(SnackBar(
                    //   content: Text(_list.toString()),
                    //   duration: Duration(seconds: 3),
                    // ));
                  },
                  color: Colors.black12,
                  child: Text("Accept"),
                  textColor: Colors.black),
              TransactionList(list: _list), // hiển thị list danh sách
            ],
          ),
        ),
      ),
    );
  }

  void _insertTransaction() {
    if (_name.isEmpty) {
      _globalKey.currentState!.showSnackBar(SnackBar(
        content: Text("Tên không được bỏ trống"),
        duration: Duration(seconds: 2),
      ));
    } else if (_age.isNaN) {
      _globalKey.currentState!.showSnackBar(SnackBar(
        content: Text("Tuổi phải là số nguyên"),
        duration: Duration(seconds: 2),
      ));
    } else {
      _list.add(Transaction(name: _name, age: _age, date: _date));
      _name = "";
      _age = 0;
      _ageController.text = "";
      _nameController.text = "";
    }
  }
}
