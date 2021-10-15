import 'package:basic_tutorial/models/catalog.dart';
import 'package:basic_tutorial/widgets/drawer.dart';
import 'package:basic_tutorial/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catelog App",
          style: TextStyle(
            color: Colors.black
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context,index) {
              return ItemWidget(
                  item: dummyList[index]);

        }),
      ),
      drawer: MyDrawer(),
    );
  }
  
}