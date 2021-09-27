import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Shared extends StatefulWidget {
  const Shared({Key key}) : super(key: key);

  @override
  _SharedState createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  int counter = 0;

  _increment() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    int counter= sp.getInt('counter') ?? 0;
  }
  @override
  void initState() {
    _increment();
    super.initState();
  }

  increment() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
   setState(() {
     counter++;
     sp.setInt('counter', counter);
   });
  }

  decrement() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      counter--;
      sp.setInt('counter', counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Shared Preference",
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$counter",
          style: TextStyle(
            fontSize: 22,
          ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("-",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                onPressed: (){
                  decrement();
                },
              ),

              RaisedButton(
                child: Text("+",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: (){
                  increment();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
