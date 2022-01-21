import 'package:flutter/material.dart';
import 'package:link_tree/cardSection.dart';
import 'package:link_tree/config.dart';
import 'package:url_launcher/url_launcher.dart';

final userList=User.generateUsers();
class mainScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey,//background color
      body: Center(
    child: Container(
      margin: new EdgeInsets.all( 20.0),// making the page ceprate from corners
      child: SingleChildScrollView(// making it scrollable
        child: Column(
           children: [
      
        Stack(// using it for add a text with the image
          children: [
          ClipRRect(//the picture
           borderRadius: BorderRadius.circular(8.0),//for rounder corners
           child: Image.network('${userList[0].imageURL.toString()}',
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
                padding: EdgeInsets.all(5),
                child: Text(
                  'loking for a job',
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),

      Divider(color: Colors.transparent,),//make a space with divider
      
           Text(userList[0].name,// name
           style: TextStyle(fontSize: 25.0,fontWeight:FontWeight.bold,color: Colors.purple),), 
      
           Text(userList[0].title,//title
           style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.amber),),
      
           Text(userList[0].location,//location
           style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.purpleAccent),),  
                 
                   Padding(//for making the line
                    padding: EdgeInsets.only(right: 80,left:80),
                  child: Divider(
                    height: 40,
                   color:Colors.black,
                    ) ),
                 
               Text(userList[0].bio,//bio text
               style:TextStyle(fontSize: 15.0,fontWeight:FontWeight.w400,color: Colors.black54),
                textAlign:TextAlign.center ,),
      
      
                     EButton(label: "Facebook",color: Colors.pinkAccent, onTab:(){launchInBrowser(userList[0].facebook);} ),
                     EButton(label: "GitHub",color: Colors.greenAccent, onTab:(){launchInBrowser(userList[0].github);} ),
                     EButton(label: "instagram",color: Colors.amberAccent, onTab:(){launchInBrowser(userList[0].instagram);} ),
                     EButton(label: "StackOverFlow",color: Colors.blueAccent, onTab:(){launchInBrowser(userList[0].stackOverFlow);} ),
           
             Divider(color: Colors.transparent,),

             Container(
                
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   
                      EPButton(label: Icons.phone,color: Colors.pinkAccent, onTab:(){_makePhoneCall(userList[0].phone);} ),
                      EPButton(label: Icons.mail_outline,color: Colors.greenAccent, onTab:(){mailMe(userList[0].email);} ),
                      EPButton(label: Icons.sms,color: Colors.amberAccent, onTab:(){_sendSms(userList[0].phone);} ),
                      EPButton(label: Icons.phone_in_talk_sharp,color: Colors.blueAccent, onTab:(){_launchURLWhatsapp(userList[0].phone);} ),
                   
                          ],
                 
               ),
             ) 
           ],
          
        ),
      ),
    ),
      ),
    );
  }
}



Future<void> launchInBrowser(String url) async {// to open the brawser
   if(await canLaunch(url)){
    await launch(url);
   }else{
     throw 'could not lunch $url' ;
   }  
  }

  Future<void> _launchURLWhatsapp(_url) async { //to make a call in whatsapp
    if (await launch('https://wa.me/$_url/')) throw 'Could not launch $_url';
  }

  Future<void> mailMe(String url) async {// to send an email
  dynamic url='mailto:${userList[0].email}';
   if(await canLaunch(url)){
    await launch(url);
   }else{
     throw 'could not send email to $url' ;
   }  
  }

Future<void> _makePhoneCall(String phoneNumber) async {// to make a call in phone
    dynamic phone='tel:${userList[0].phone}';   
    await launch(phone);
  }

  Future<void> _sendSms(String phoneNumber) async {// send an sms
    dynamic phone='sms:${userList[0].phone}';  
    await launch(phone);
  }
