import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_widget/Provider/count_proider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider= Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 0), (timer) {
      countProvider.setCount();
    });
  }
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
          title: Text('Count Example'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        // child: Text(countProvider.count.toString(),style: TextStyle(fontSize: 50),),
        // Consumer widget se widget fir se nahi banti na repeat hota h
        child: Consumer<CountProvider >(builder:(context,value,child){
          return Text(value.count.toString(),style: TextStyle(fontSize: 50),);
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         countProvider.setCount();
        },
        child:  Icon(Icons.add),
      ),
    );
  }
}
