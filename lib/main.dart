import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myvoicechat/dummy.dart';
import 'chatscreen.dart';
import 'start.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:introduction_screen/introduction_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lapit',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      //home: ChatScreen(),
      //home: Dummy(),
      //home: StartPage(),
      home: OnBoardingPage(),      
    );
  }
}




class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => StartPage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          image: _buildImage('img2'),
          footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'FooButton',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of last page",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}



// void main() async {
//   //TestWidgetsFlutterBinding.ensureInitialized();
//   WidgetsFlutterBinding.ensureInitialized();
//   Stream<QuerySnapshot> getDeviceName =  Firestore.instance.collection('users').where('email',isEqualTo: 'aemail').snapshots();
//   print("HTML WebApp");
//   //print(getDeviceName.toString().toString());     //Instance of '_MapStream<QuerySnapshotPlatform, QuerySnapshot>'
//   //print(getDeviceName.toList());   //Instance of 'Future<List<QuerySnapshot>>'
  
//   //Stream<DocumentSnapshot> tasks = await donothin();

//   // Firestore.instance
//   //     .collection("users")
//   //     .getDocuments()
//   //     .then((QuerySnapshot snapshot) {
//   //   snapshot.documents.forEach((f) => print('${f.data}}'));
//   // });

//   // Firestore.instance.collection('users').document('testa')
//   //   .get().then((DocumentSnapshot) =>
//   //       print(DocumentSnapshot.data['uid'].toString())
//   // );


//   // await Firestore.instance.collection('users').document('testa').get().then((DocumentSnapshot document) {
//   //   print("x value: ${document.data['uid']}");
//   // });


//   //print(tasks);

// }




//   Future<List<Oneuser>> getUserTaskList() async {

//     QuerySnapshot qShot = 
//       await Firestore.instance.collection('users').getDocuments();

//     return qShot.documents.map(
//       (doc) => Oneuser(
        
//             )
//     ).toList();
//   }


//   Future<Stream<DocumentSnapshot>> donothin() async {

//     Stream<DocumentSnapshot> ref = Firestore.instance.collection('users').document('testa').snapshots();

//     return ref;

//   }




// class Oneuser {
//   String displayName,email,pwd,uid;
 
//  }