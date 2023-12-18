import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_widget/Screen/favourite/myfavouirte.dart';

import '../../Provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  Widget build(BuildContext context) {
    // final provider= Provider.of<FavouriteItemProvider>(context,listen: false);
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
              itemCount: 100,
                itemBuilder: (context,index){
              return Consumer<FavouriteItemProvider>(builder: (context,value,child){
              return  ListTile(
                  onTap: (){
                    if(value.selectedItem.contains(index)){
                      value.removeIndex(index);
                      // provider.removeIndex(index);
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
