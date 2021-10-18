import 'package:basic_tutorial/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


// main card page class
class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).make(),
      ),
      body:Column(
        children: [
          _CartList().p32().expand(),
           const Divider(),
          _CartTotal(),
        ],
      )
    );
  }
}

// card total class
class _CartTotal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
         ElevatedButton(onPressed: (){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               content: "Buying not supported yet".text.make()
           ),
           );
         },
             style: ButtonStyle(
               backgroundColor:
                 MaterialStateProperty.all(context.theme.buttonColor),
             ),
             child: "Buy".text.white.make()
         ).w32(context),
        ],
      ),
    );
  }
}

// card list class
class _CartList extends StatefulWidget{
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
       itemBuilder: (context, index)=>ListTile(
         leading: Icon(Icons.done),
         trailing: IconButton(
           icon: Icon(Icons.remove_circle_outline),
           onPressed: (){},
         ),
         title: "items".text.make(),
       ),
   );
  }
}