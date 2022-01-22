import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:link_tree/Style/style.dart';
import 'package:link_tree/service/auth_service.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = 'user name';
  String? password;
  String? theLoggedInUser;

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Welcome $name'),
            Form(
                child: Column(
              children: [
                Text('the logged in user: $theLoggedInUser'),

                //user name
                TextFormField(
                  controller: _userNameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: generalInputDecoration(
                      labelText: 'User Name', hintText: 'email@something.com'),
                ),
                //passsword

                SizedBox(height: 15),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: generalInputDecoration(labelText: 'Password'),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    setState(() {
                      name = _userNameController.value.text;
                      password = _passwordController.value.text;
                    });
                    name = name.trim(); //remove spaces
                    name = name.toLowerCase(); //convert to lowercase

                    await Provider.of<AuthService>(context, listen: false)
                        .loginWithEmailAndPassword(name, password!)
                        .then((value) {
                      setState(() {
                        theLoggedInUser = value!.user!.uid;
                      });
                      Navigator.of(context)
                                    .pushNamed('/rejesteration');
                    });
                  },
                  icon: Icon(
                    Icons.login,
                  ),
                  label: Text(
                    'Login',
                  ),
                ),

                //error
                Provider.of<AuthService>(context).theError == null
                    ? Container()
                    : Container(
                        child: Text(
                          Provider.of<AuthService>(context).theError!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                SizedBox(
                  height: 50,
                ),
                
              ],
            ))
          ],
        ),
      ),
    );
  }
}
