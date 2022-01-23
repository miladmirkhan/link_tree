import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreenView extends StatelessWidget {
  HomeScreenView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:   Text("Welcome",textAlign: TextAlign.center,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/signUp');
                              },
                              child: Text('sign Up')),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                         ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/createProfile');
                              },
                              child: Text('Create Profile')),
                        

                         
                           ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/mainScreen');
                              },
                              child: Text('View Profile')),
                        
                      ],
                    ),
                  ),

            //show this only to logged in users
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                
              ),
            )
          ],
        ),
      ),
    );
  }
}






