import 'package:flutter/material.dart';
import 'package:flutter_widget/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  int index = 0;

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  List<Transaction> list;
  TransactionList({required this.list});
  Transaction transaction = Transaction(name: "", age: 0, date: DateTime.now());
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  ListView buidWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: (index % 2) == 0 ? Colors.greenAccent : Colors.amber,
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        "Name: " + list[index].name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${DateFormat.yMMMd().format(list[index].date)}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10))
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Age:" + list[index].age.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10, top: 10)),
                    ],
                  )),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: this.buidWidget(),
    );
  }
}
// ListTile(
// leading: const Icon(Icons.access_alarm),
// title: Text(list[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
// subtitle: Text(list[index].age.toString(), style: TextStyle(fontSize: 16,)),
// onTap: () {
// _globalKey.currentState!.showSnackBar(SnackBar(
// content: Text("You clicked me"),
// duration: Duration(seconds: 2),
// ));
// },
// ),
