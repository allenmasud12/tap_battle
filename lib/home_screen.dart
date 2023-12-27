import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int red = 50;
  int blue = 50;

  void redScoreUpdate(){
    setState(() {
      red = red +1;
      blue = blue -1;
    });
  }

  void blueScoreUpate(){
    setState(() {
      red = red -1;
      blue = blue +1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: red,
                child: InkWell(
                  onTap: redScoreUpdate,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                flex: blue,
                  child: InkWell(
                    onTap: blueScoreUpate,
                    child: Container(
                      color: Colors.blue,
                    ),
                  )
              )
            ],
          ),
          red >= 100 || blue >= 100?
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.purple.withOpacity(0.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${red >= 100?"Red": "Blue"}Win', style: TextStyle(fontSize: 40, color: Colors.white),),
                  ElevatedButton(onPressed: (){
                   setState(() {
                     red = 50;
                     blue = 50;
                   });
                  },
                      child: Text('Again', style: TextStyle(fontSize: 24, color: Colors.red),)),
                ],
              )
            ),
          ):Container()
        ],
      ),
    );
  }
}
