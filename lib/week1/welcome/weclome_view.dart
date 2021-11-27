import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeView extends StatelessWidget{
  final appBarTitle="Instagram";
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar: AppBar(
       actions: [
        IconButton(
          icon: Icon(Icons.favorite),
        onPressed: (){
            showModalBottomSheet(
              context: context, 
              builder: (context)=>Column(),
              );
        }, )
       ],
       title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Icon(Icons.wallpaper),
             Icon(Icons.sms_failed),
             Text(appBarTitle,style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.amberAccent),)
         ],
       ),
     ),
     body:Column(
       children: [
         Expanded(
           flex: 7,
           child: ListView(
             children: [
               Container(
                 height: MediaQuery.of(context).size.height*0.1,
                 color: Colors.black,
               ),
                Container(
                   height: MediaQuery.of(context).size.height*0.5,
                   color: Colors.yellow,
                   child: ListView.builder(
                     itemCount: 25,
                     itemBuilder: (context,index)
                    {
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.star_border),
                          title: Text("App Deneme $index"),
                          trailing: Icon(Icons.arrow_right),
                          onTap: (){
                            
                          },
                          ),
                      );
                    }
                   ),
               ),
                Container(
                 height: 100,
                 color: Colors.green,
               ),
                Container(
                 height: 100,
                 color: Colors.cyan,
               ),
                Container(
                 height: 100,
                 color: Colors.pink,
               ),
             ],
           )
         ),
         Expanded(
           child: Container(
             width: 100,
             height: 100,
             color: Colors.yellow,
           ),
         ),
         Expanded(
           child: Container(
             width: 100,
             height: 100,
             color: Colors.pink,
           ),
         ),
       ],
     ) ,
   );
  }  }
