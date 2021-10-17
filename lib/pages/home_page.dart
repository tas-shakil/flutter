import 'package:basic_tutorial/models/catalog.dart';
import 'package:basic_tutorial/widgets/home_widgets/catalog_header.dart';
import 'package:basic_tutorial/widgets/home_widgets/catalog_list.dart';
import 'package:basic_tutorial/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if(CatalogModel.items.isNotEmpty)
                const CatalogList().expand()
              else
                const CircularProgressIndicator().centered().expand(),

            ],
          ),
        ),
      ),
    );
  }
}





class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Image.network(
       image
   ).box.rounded.p16.color(MyTheme.creamColor).make().p16().w40(context);
  }
}


