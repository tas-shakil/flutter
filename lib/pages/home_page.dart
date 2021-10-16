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
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty) ? ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context,index) {
              return ItemWidget(
                  item: CatalogModel.items[index]);

        }): const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}