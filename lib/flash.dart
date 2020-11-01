import 'package:flashlight/flashlight.dart';
import 'package:flutter/material.dart';

class FlashReflector extends StatefulWidget {
  bool ekran;
  bool flash;
  FlashReflector(this.ekran, this.flash);

  @override
  _FlashReflectorState createState() => _FlashReflectorState();
}

class _FlashReflectorState extends State<FlashReflector> {
  var flas=true;

  Color colorgel =Colors.white;
var don = 1;
  @override
  void initState() {
    calsitir();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        onPressed: ()=> Navigator.pop(context),

        backgroundColor: Colors.black,
        child: Icon(Icons.stop),),
      appBar: AppBar(backgroundColor: colorgel ==Colors.red ? Colors.green: colorgel == Colors.white ? Colors.red:Colors.white,),
      body: Container(
        child: Transform.rotate(angle:1.56,child: Center(child: Text("ACİL DURUM",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w900,color: colorgel ==Colors.red ? Colors.green: colorgel == Colors.white ? Colors.red:Colors.white ),),)),
        color: colorgel,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
  void calsitir() {

    Future.delayed(Duration(milliseconds: 300),(){
// ignore: unnecessary_statements
widget.ekran ? colorgel = colorgel == Colors.red ? Colors.green: colorgel == Colors.white ? Colors.red:Colors.white:null;
setState(() {
 widget.flash ? flas ? Flashlight.lightOn():Flashlight.lightOff():null;
  flas ? flas = false:flas=true;
  don++;

});
      calsitir();
    });
  }

}



