import 'package:flutter/material.dart';
import 'package:link_tree/mainScreen/cardSection.dart';
import 'package:link_tree/config.dart';
import 'package:link_tree/service/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class mainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     AuthService _authProvider = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen'), actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthService>(context, listen: false).logOut();
              },
              icon: Icon(Icons.logout)),
        ]),
      backgroundColor: Colors.grey,//background color
      body: _authProvider.generalUser == null
            ? Container(child: Text('You are not authorisef')): Container(
      margin: new EdgeInsets.all( 20.0),// making the page ceprate from corners
      child: SingleChildScrollView(// making it scrollable
        child: Column(
           children: [
      
        Stack(// using it for add a text with the image
          children: [
          ClipRRect(//the picture
           borderRadius: BorderRadius.circular(8.0),//for rounder corners
           child: Image.network('${ _authProvider.generalUser!.imageURL}',
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
      
           Text( _authProvider.generalUser!.name!,// name
           style: TextStyle(fontSize: 25.0,fontWeight:FontWeight.bold,color: Colors.purple),), 
      
           Text( _authProvider.generalUser!.title!,//title
           style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.amber),),
      
           Text(_authProvider.generalUser!.location!,//location
           style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.purpleAccent),),  
                 
                   Padding(//for making the line
                    padding: EdgeInsets.only(right: 80,left:80),
                  child: Divider(
                    height: 40,
                   color:Colors.black,
                    ) ),
                 
               Text(_authProvider.generalUser!.bio!,//bio text
               style:TextStyle(fontSize: 15.0,fontWeight:FontWeight.w400,color: Colors.black54),
                textAlign:TextAlign.center ,),
      
      
                     EButton(label: "Facebook",color: Colors.pinkAccent, onTab:(){launchInBrowser(_authProvider.generalUser!.facebook!);} ),
                     EButton(label: "GitHub",color: Colors.greenAccent, onTab:(){launchInBrowser(_authProvider.generalUser!.github!);} ),
                     EButton(label: "Instagram",color: Colors.amberAccent, onTab:(){launchInBrowser(_authProvider.generalUser!.instagram!);} ),
                     EButton(label: "LinkedIn",color: Colors.amberAccent, onTab:(){launchInBrowser(_authProvider.generalUser!.linkedIn!);} ),
                     EButton(label: "StackOverFlow",color: Colors.limeAccent, onTab:(){launchInBrowser(_authProvider.generalUser!.stackOverFlow!);} ),
           
             Divider(color: Colors.transparent,),

             Container(
                
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   
                      EPButton(label: Icons.phone,color: Colors.pinkAccent, onTab:(){_makePhoneCall(_authProvider.generalUser!.phone!);} ),
                      EPButton(label: Icons.mail_outline,color: Colors.greenAccent, onTab:(){mailMe(_authProvider.generalUser!.email!);} ),
                      EPButton(label: Icons.sms,color: Colors.amberAccent, onTab:(){_sendSms(_authProvider.generalUser!.phone!);} ),
                      EPButton(label: Icons.phone_in_talk_sharp,color: Colors.blueAccent, onTab:(){_launchURLWhatsapp(_authProvider.generalUser!.phone!);} ),
                   
                          ],
                 
               ),
             ) 
           ],
          
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
  
  dynamic aurl='mailto:$url';
   if(await canLaunch(aurl)){
    await launch(aurl);
   }else{
     throw 'could not send email to $url' ;
   }  
  }

Future<void> _makePhoneCall(String phoneNumber) async {// to make a call in phone
    dynamic phone='tel:$phoneNumber';   
    await launch(phone);
  }

  Future<void> _sendSms(String phoneNumber) async {// send an sms
    dynamic phone='sms:$phoneNumber';  
    await launch(phone);
  }
