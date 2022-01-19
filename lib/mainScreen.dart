import 'package:flutter/material.dart';
import 'package:link_tree/config.dart';
import 'package:url_launcher/url_launcher.dart';

final userList=User.generateUsers();
class mainScreen extends StatelessWidget {
  
void _launchURL(String _url) async {// for URL_LAUNCHER
  if (!await launch(_url)) throw 'Could not launch $_url';
}
  @override
  Widget build(BuildContext context) {
    
  

    return Scaffold(
      backgroundColor: Colors.grey,//background color
      body: Center(
    child: Container(
      margin: new EdgeInsets.all( 20.0),// making the page ceprate from corners
      child: SingleChildScrollView(// making it scrollable
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             
            //  this is for making the circle picture
            //  Expanded(
            //    child: Container(
            //      height: 150,
            //      decoration: BoxDecoration(
            //        shape: BoxShape.circle,
            //        image: DecorationImage(
            //        image: NetworkImage('https://picsum.photos/250?image=9'), 
            //        ),
            //      ),
            //    ),
            //  ),
      
        Stack(
          children: [
          ClipRRect(//the picture
           borderRadius: BorderRadius.circular(8.0),//for rounder corners
           child: Image.network('data:image/jpeg;base64,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',
              width: 160.0,
              height: 160.0,
              fit: BoxFit.fill,
           ),
         ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 160,
                color: Colors.white54,
                padding: EdgeInsets.all(10),
                child: Text(
                  'loking for a job',
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),

      // Container(
      //   child:ClipRRect(//the picture
      //      borderRadius: BorderRadius.circular(8.0),//for rounder corners
      //      child: Image.network('https://picsum.photos/250?image=9',
      //         width: 140.0,
      //         height: 120.0,
      //         fit: BoxFit.fill,
        
      //      ),
        
      //    ),
      // ),
      Divider(color: Colors.transparent,),//make a space with divider
      
           Text(userList[0].name,// name
           style: TextStyle(fontSize: 25.0,fontWeight:FontWeight.bold,color: Colors.purple),), 
      
           Text(userList[0].title,//title
           style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.amber),),
      
           Text(userList[0].location,//location
           style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.amber),),  
                 
                 
                   Padding(//for making the line
                    padding: EdgeInsets.only(right: 80,left:80),
                  child: Divider(
                    height: 40,
                   color:Colors.black,
                    ) ),
                 
               Text(userList[0].bio,//bio text
               style:TextStyle(fontSize: 15.0,fontWeight:FontWeight.w400,color: Colors.black54),
                textAlign:TextAlign.center ,),
      
      
            SizedBox(height:23.0,),
            cardsection(label: 'Git Hub',url:userList[0].github ,),
            
            cardsection(label: 'facebook',url:userList[0].github ,),
            
           ],
          
        ),
      ),
    ),
      ),
    );
  }
}

class cardsection extends StatelessWidget {

  final String label;
  final String url;

  const cardsection({Key? key, required this.label, required this.url}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
      var size=MediaQuery.of(context).size;
    return GestureDetector(
      
    child:Container(
      
            width: size.width*.8,
            height: size.height*0.08,
            child: Card(
              elevation: 5.0,
              child: Center(child: Text(label,
              style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold ),
              )
              ),
            ),
          ));
  }
  }