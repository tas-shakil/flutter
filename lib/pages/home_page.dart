import 'package:basic_tutorial/models/catalog.dart';
import 'package:basic_tutorial/widgets/drawer.dart';
import 'package:basic_tutorial/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    loadData();
  }

  //load all data
  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decoderData = jsonDecode(catalogJson);
    var productsData = decoderData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
    });

  }



  @override
  Widget build(BuildContext context) {

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
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty) ?
         GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 16,
                 crossAxisSpacing: 16),
             itemBuilder: (context, index){
               final item = CatalogModel.items[index];
               return Card(
                 clipBehavior: Clip.antiAlias,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10)),
                   child: GridTile(
                       header: Container(
                           child: Center(
                             child: Text(item.name,style: const TextStyle(
                               color: Colors.white,
                             ),
                             ),
                           ),
                           padding: const EdgeInsets.all(12),
                           decoration: const BoxDecoration(
                             color: Colors.deepPurple,

                           ),

                       ),
                       child: Image.network(item.image),
                       footer: Container(
                           child: Text(item.price.toString(), style: const TextStyle(
                             color: Colors.white
                           ),
                           ),
                           padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.black
                          ),
                       ),
                   ),
               );
             },
             itemCount: CatalogModel.items.length,
         )
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}