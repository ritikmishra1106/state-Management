import 'dart:async';

import 'package:flutter/material.dart';

class WhyProiderScreen extends StatefulWidget {
  const WhyProiderScreen({super.key});

  @override
  State<WhyProiderScreen> createState() => _WhyProiderScreenState();
}

class _WhyProiderScreenState extends State<WhyProiderScreen> {
  int count =0;
  void initState(){
    super.initState();

    Timer.periodic(Duration(microseconds: 100), (timer) {
      count++;
      setState(() {

      });
      print(count);
    });
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Why Provider'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(DateTime.now().hour.toString() +":"+ DateTime.now().minute.toString()),
          ),
          Center(
            child: Text(count.toString(),style: TextStyle(fontSize: 50),),
          )
        ],
      ),
    );
  }
}
