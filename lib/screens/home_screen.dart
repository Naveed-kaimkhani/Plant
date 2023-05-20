import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant/reusable_widgets/reusable_widgets.dart';
import 'package:plant/screens/scanning_screen.dart';
import 'package:plant/screens/signin_screen.dart';
import 'package:plant/screens/scanning_screen.dart';
import 'package:plant/screens/chatBot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            Colors.purple ,Colors.orange
            /*hexStringToColor("CB2893"),
        hexStringToColor("9546C4"),
        hexStringToColor("5E61F4")*/
          ],
              begin:Alignment.topCenter, end: Alignment.bottomCenter
          )),

          alignment: Alignment(0, 0),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(2.0),

                child: Column(
                    children: <Widget>[
                      logoWidget("assets/images/logo1.png"),
                      SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              padding:
                              MaterialStateProperty.all(const EdgeInsets.all(20)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ScanningScreen()));
                            },
                            child: const Text("Scan Your Leaf", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              padding:
                              MaterialStateProperty.all(const EdgeInsets.all(20)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                              ),),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ChatBot()));
                            },
                            child: const Text("ChatBot", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        width: 200,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                padding:
                                MaterialStateProperty.all(const EdgeInsets.all(20)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                ),),
                              onPressed: (){
                                FirebaseAuth.instance.signOut().then((value) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => SignInScreen()));
                                });
                              },
                              child: const Text("LOGOUT", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)
                          )
                      ),
                    ]
                ),
              )
          )
      ),
    );
  }
}