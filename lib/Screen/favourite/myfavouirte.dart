import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favoruiteProider  = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavouriteItemScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoruiteProider.selectedItem.length,
                itemBuilder: (context,index){
                  return Consumer<FavouriteItemProvider>(builder: (context,value,child){
                    return  ListTile(
                      onTap: (){
                        if(value.selectedItem.contains(index)){
                          value.removeIndex(index);
                        }else{
                          value.addIndex(index);
                        }
                      },
                      title: Text('Item'+ index.toString()),
                      trailing: Icon(

                          value.selectedItem.contains(index)?Icons.favorite  :Icons.favorite_outline),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
