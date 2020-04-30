import 'package:flutter/material.dart';
//import 'auth_toolkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'chat_home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginEmailController , loginPassController;
  //FirebaseAuthToolKit _authToolKit = FirebaseAuthToolKit();

  @override
  void initState() {
    super.initState();
    loginEmailController = TextEditingController();
    loginPassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text(
            "Login to your account",
            style: TextStyle(
              fontSize: 25.0
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: loginEmailController,
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
              ),
            ),
          ),
          TextField(
            controller: loginPassController,
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
              onPressed: () async {

                  String suid;
                  String suname;

                  await Firestore.instance.collection('users').document(loginEmailController.text).get().then((DocumentSnapshot document) {
                    //print("x value: ${document.data['uid']}");


                    // Fluttertoast.showToast(
                    //   msg: document.data['displayName'],
                    //   toastLength: Toast.LENGTH_LONG,
                    // );

                    suid = document.data['uid'];
                    suname = document.data['displayName'];

                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChatHome(),
                          settings: RouteSettings(
                            //arguments: '1',
                            arguments: {'curuserid': suid,'curusername':suname}
                          ),
                        )
                    );

                  });

                //List<Oneuser> users = await getUserTaskList();
                
                //var umap = users.asMap();


                //List<Oneuser>  lo  = users.where((user) => user.email.contains(loginEmailController.text)).toList();

                // Fluttertoast.showToast(
                //   msg: umap[0].displayName,
                //   toastLength: Toast.LENGTH_LONG,
                // );


                // _authToolKit.firebaseLogin(
                //   loginEmailController.text,
                //   loginPassController.text,
                //   context
                // );


                // final snapShot = await Firestore.instance
                //   .collection('posts')
                //   .document(docId)
                //   .get();

                // if (snapShot == null || !snapShot.exists) {
                //   // Document with id == docId doesn't exist.
                // }

                //DocumentReference reference =
                //Firestore.instance.collection('users').document('xyz');
                
                
                //Firestore.instance.collection('users').document(signupNameController.text);





                // Stream<QuerySnapshot> getDeviceName =  Firestore.instance.collection('users').where('email',isEqualTo: loginEmailController.text).snapshots();


                // if (getDeviceName!=null)  {


                      

                //       String suid;
                //       String suname;
                      
                //       getDeviceName.listen((snapshot) {

                //         for (DocumentSnapshot doc in snapshot.documents) {

                //                                   Fluttertoast.showToast(
                //                                     msg: doc.data[1].toString(),
                //                                     toastLength: Toast.LENGTH_LONG,
                //                                   );

                //         }


                //       });
                        
                //       //   Fluttertoast.showToast(
                //       //     msg: suid,
                //       //     toastLength: Toast.LENGTH_LONG,
                //       //   );


                //         // Navigator.of(context).push(
                //         //     MaterialPageRoute(
                //         //       builder: (context) => ChatHome()
                //         //     )
                //         // );


                //         // Navigator.of(context).push(
                //         //     MaterialPageRoute(
                //         //       builder: (context) => ChatHome(),
                //         //       settings: RouteSettings(
                //         //         //arguments: '1',
                //         //         arguments: {'curuserid': suid,'curusername':suname}
                //         //       ),
                //         //     )
                //         // );

                // }



                //await reference.setData({"email": signupEmailController.text, "pwd": signupPassController.text});
                // await reference.setData({"email": signupEmailController.text, "pwd": signupPassController.text}).then((onValue)
                // {
                //     _scaffoldKey2.currentState.showSnackBar(
                //       SnackBar(
                //         content: Text('PASSWORD RESET EMAIL SENT'),
                //       ),
                //     );

                // });


              },
              color: Theme.of(context).primaryColor,
              child: Text("LOGIN"),
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPassController.dispose();
    super.dispose();
  }



  Future<List<Oneuser>> getUserTaskList() async {

    QuerySnapshot qShot = 
      await Firestore.instance.collection('users').getDocuments();

    return qShot.documents.map(
      (doc) => Oneuser(
            )
    ).toList();
  }

}



class Oneuser {
  String displayName,email,pwd,uid;
 
 }