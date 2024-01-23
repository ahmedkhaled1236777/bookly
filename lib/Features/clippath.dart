import 'package:flutter/material.dart';

class mypath extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: 
        Column
        
        (
          
          children: [
          ClipPath(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            clipper:myclipper() ,
            child: Container(width: double.infinity,height: 150,color: Colors.blue,child: Align(alignment: Alignment.topCenter,child: Column(
              children: [
                SizedBox(height: 40,),
                Text("my clipper",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,)),
              ],
            )),)
          )
        ],),
      ),
    );
  }
  
}
class myclipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
  double h=size.height;
  double w =size.width;
  final path_0=Path();
  path_0.lineTo(0, h);
  path_0.quadraticBezierTo(w*0.02, h*0.65,w*0.15, h*0.65);
  path_0.lineTo(w*0.85, h*0.65);
    path_0.quadraticBezierTo(w*0.98, h*0.65,w, h*0.35);
  path_0.lineTo(w, h*0);
  path_0.close();
       // path_0.moveTo(size.width*1.0044365,size.height*0.0020000);
    //path_0.lineTo(size.width*0,size.height*0);
    //path_0.quadraticBezierTo(size.width*0.0013334,size.height*0.2698571,size.width*0.0013334,size.height*0.3591429);
    //path_0.cubicTo(size.width*0.2574874,size.height*-0.0827857,size.width*0.4856246,size.height*0.4962143,size.width*1.0019350,size.height*0.3605714);
    //path_0.quadraticBezierTo(size.width*1.0025604,size.height*0.2709286,size.width*1.0044365,size.height*0.0020000);
   // path_0.close();


   return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
 return false;
  }

}