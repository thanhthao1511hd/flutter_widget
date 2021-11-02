import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// statedullWidget gồm 2 class: 1 public class kế thừa StatfulWidget
// và 1 priavte class để vẽ giao diện qua hàm build
class Stateful extends StatefulWidget{
  String hometown;
  int code;
  Stateful({required this.hometown, required this.code});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }

}
class _MyAppState extends State<Stateful> with WidgetsBindingObserver{
  String _name=""; // this is state
  final nameEdittingController=TextEditingController(); // theo dõi sự thay đổi giá trị trên TextField
  // Vòng đời của 1 Widget
  // bắt đầu với initState() -> build(). Mỗi lần state thay đổi sẽ nhảy vào hàm build()
  // dispose() khi chuyển sang màn hình khác, màn hình ban đầu bị huỷ đi

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state==AppLifecycleState.paused)
      {
        print("App is paused");
      }else if(state==AppLifecycleState.resumed){
      print("App is Resume");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
   // nameEdittingController.dispose();
    print("Run initState");

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    print("Run dispose");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("Run build");

    // Hiển thị ngày tháng hiện tại
    DateTime dateTime=new DateTime.now();
    DateTime date=new DateTime(2020, 11, 11);
    return MaterialApp(
      title: "This is StatefulWidget",
      home: Scaffold(
        body: Center(
         // child: Text("This is StatefulWidget\n${widget.hometown} \n${widget.code}"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Định dạng theo chiều dọc - hiển thị nội dung ra giữa màn hình
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: TextField(
                controller: nameEdittingController,
                onChanged: (text){
                  this.setState(() {
                    _name=text;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(20))),
                    labelText: "Enter name: "
                ),
              ),
            ),
            Text(
              _name,
              style: TextStyle(fontSize: 20, color: Colors.redAccent),
            ),
            Text(
              // thư viện intl - có các hàm format định dạng ngày tháng
              // DateFormat('yyyy/MM/dd').format(date),
             // DateFormat.yMMMd().format(date),
              NumberFormat("###.###", "en_US").format(12.2322352),
              style: TextStyle(fontSize: 20, color: Colors.greenAccent),
            )
          ],
        ),
        ),
      )
    );
  }
}
