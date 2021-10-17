import 'package:basic_tutorial/models/catalog.dart';
import 'package:basic_tutorial/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget{
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(backgroundColor: Colors.transparent,),
     backgroundColor: context.canvasColor,
     bottomNavigationBar:ButtonBar(
       alignment: MainAxisAlignment.spaceBetween,
       buttonPadding: EdgeInsets.zero,
       children: [
         "\$${catalog.price}".text.bold.xl4.red800.make(),
         ElevatedButton(onPressed: (){},
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(
                 context.theme.buttonColor,
               ),
               shape: MaterialStateProperty.all(
                 const StadiumBorder(),
               ),
             ),

             child: "Add to cart".text.make()
         ).wh(120,50)
       ],
     ).p16(),
     body: SafeArea(
       bottom: false,
       child: Column(
         
         children: [
           Hero(
               tag: Key(catalog.id.toString()),
               child: Image.network(catalog.image,
               ),


           ).h32(context),
           Expanded(

             child: VxArc(
               height: 30.0,
               arcType: VxArcType.CONVEY,
               edge: VxEdge.TOP,
               child: Container(
                 color: context.cardColor,
                 width: context.screenWidth,
                 child: Column(
                   children: [
                     catalog.name.text.xl4.color(context.accentColor).bold.make(),
                     catalog.desc.text.xl.make(),
                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"
                         .text
                         .make()
                        .p16()
                   ],
                 ).py64(),


           ),
             ),
           )
         ],

       ),
     ),
   );
  }

}