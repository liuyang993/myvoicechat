import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'auth_toolkit.dart';

import 'package:uuid/uuid.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  
  //FirebaseAuthToolKit authToolKit = FirebaseAuthToolKit();
  
  final _scaffoldKey2 = GlobalKey<ScaffoldState>();


  TextEditingController signupEmailController , signupPassController , signupNameController;

  @override
  void initState() {
    signupEmailController = TextEditingController();
    signupPassController = TextEditingController();
    signupNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey2,
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text(
            "Create a new Account",
            style: TextStyle(
              fontSize: 25.0
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: signupNameController,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFff5521),
                  width: 2.0
                ),
              ),
              labelText: "Display Name",
              labelStyle: TextStyle(
                color: Colors.blueGrey
              )
            ),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: signupEmailController,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFff5521),
                  width: 2.0
                ),
              ),
              labelText: "Your Email",
              labelStyle: TextStyle(
                color: Colors.blueGrey
              )
            ),
          ),
          TextField(
            controller: signupPassController,
            obscureText: true,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFff5521),
                  width: 2.0
                ),
              ),
              labelText: "Password",
              labelStyle: TextStyle(
                color: Colors.blueGrey
              )
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerRight,
            child: RaisedButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                // authToolKit.firebaseSignup(
                //   signupNameController.text,
                //   signupEmailController.text,
                //   signupPassController.text,
                //   context
                //   );


                      // var documentReference = Firestore.instance
                      // .collection('messages')
                      // .document(signupNameController.text)
                      // .collection(signupNameController.text)
                      // .document(signupNameController.text);

                      // Firestore.instance.runTransaction((transaction) async {
                      //   await transaction.set(
                      //     documentReference,
                      //     {
                      //       'email': 'Tom',
                      //       'pwd': 'Jack',
                      //     }
                      //     ).then((value){

                      //     });
                      //   });  

                           
                    Firestore.instance
                        .runTransaction((Transaction transaction) async {

                      //  这种写法是往已有的document  update      
                      // CollectionReference reference =
                      // Firestore.instance.collection('users');
                      // await reference.document(signupNameController.text).setData({"email": signupEmailController.text, "pwd": signupPassController.text});


                      DocumentReference reference =
                      Firestore.instance.collection('users').document(signupNameController.text);
                      //Firestore.instance.collection('users').document('xyz');
                      //Firestore.instance.collection('users').document(signupNameController.text);

                      

                      //await reference.setData({"email": signupEmailController.text, "pwd": signupPassController.text});
                      await reference.setData({"email": signupEmailController.text, "pwd": signupPassController.text,"displayName": signupNameController.text,"uid": Uuid().v1().toString()}).then((onValue)
                      {
                          _scaffoldKey2.currentState.showSnackBar(
                            SnackBar(
                              content: Text('success reg'),
                            ),
                          );



                      });




                      // await reference
                      //     .add({"email": signupEmailController.text, "pwd": signupPassController.text});

                      });


                        

              },
              color: Color(0xFFff5521),
              child: Text("CREATE ACCOUNT"),
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
  
  

  @override
  void dispose() {
    super.dispose();
    signupNameController.dispose();
    signupEmailController.dispose();
    signupPassController.dispose();
  }
}