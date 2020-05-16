import 'package:chatapp/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SignUpPage(),
));

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String userName , email , password;
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[800],
                  Colors.orange[600],
                  Colors.orange[400],
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Register", style: TextStyle(color: Colors.white, fontSize: 40 , letterSpacing: 1.0),),
                  SizedBox(height: 10,),
                  Text("For Chatter", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      return (value.isEmpty) ? 'Invalid user name' : null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "User name",
                                        hintStyle: TextStyle(color: Colors.grey , letterSpacing: 1.0),
                                        border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      return (value.isEmpty || !value.contains('@') || !value.contains('.')) ? 'Invalid Email' : null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      fillColor: Colors.deepOrange,
                                      hintStyle: TextStyle(color: Colors.grey ,letterSpacing: 1.0),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                                  ),
                                  child: TextFormField(
                                    onChanged: (String value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                    validator: (value) {
                                      return (value.isEmpty || value.length < 6) ? 'Invalid Password' : null;
                                    },
                                    style: TextStyle(letterSpacing: 1.5),
                                    obscureText: hidePassword,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye , color: Colors.deepOrangeAccent,),
                                          onPressed: () {
                                            setState(() {
                                              if(hidePassword) {
                                                hidePassword = false;
                                              } else {
                                                hidePassword = true;
                                              }
                                            });
                                          },
                                        ),
                                        hintStyle: TextStyle(color: Colors.grey , letterSpacing: 1.0),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      return (value != password) ? 'Passwords did\'nt Match' : null;
                                    },
                                    style: TextStyle(letterSpacing: 1.5),
                                    obscureText: hidePassword,
                                    decoration: InputDecoration(
                                        hintText: "Re-Enter Password",
                                        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye , color: Colors.deepOrangeAccent,),
                                          onPressed: () {
                                            setState(() {
                                              if(hidePassword) {
                                                hidePassword = false;
                                              } else {
                                                hidePassword = true;
                                              }
                                            });
                                          },
                                        ),
                                        hintStyle: TextStyle(color: Colors.grey , letterSpacing: 1.0),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange[700]
                          ),
                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                if(_formKey.currentState.validate()) {

                                }
                              },
                                child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.0 , fontSize: 16.0),)),
                          ),
                        ),
                        SizedBox(height: 20,),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child : Text("Already have An Account? Login here!", style: TextStyle(color: Colors.grey , fontSize: 16.0),),),
                        SizedBox(height: 20,),
                        Text("OR Continue with", style: TextStyle(color: Colors.grey , fontSize: 14.0 , fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blueGrey
                                ),
                                child: Center(
                                  child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black
                                ),
                                child: Center(
                                  child: Text("Github", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
