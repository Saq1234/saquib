import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newapps/settings.dart';
import 'package:newapps/webview.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:intl/intl.dart';




void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  Main(),
    );
  }
}


class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);


  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController? textController;
  String? result = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateOtp();

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:
        AppBar(

          toolbarHeight: MediaQuery
              .of(context)
              .size
              .height / 5,
          backgroundColor: Color(0xff002633),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  showAlertDialog(context);

                },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
         // Icon(Icons.settings),
          title:
          Container(
            height: 60,
            // color: Colors.lightBlue,
            width: MediaQuery
                .of(context)
                .size
                .width / 1.7,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Color(0xff002633),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),

                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Home",),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("About us",),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Updates"),
                      ),
                    ),
                  ]),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff015574)
            ),
          ),
          titleSpacing: 100,
        ),
        body:
        TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: MYWeb(),

            ), Center(
              child: MyWeb1(),
            ), Center(
              child: MyWeb2(),
            ),
          ],),

      ),
    );
  }

  Future<void> generateOtp() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate); //
    var newDD = DateTime
        .now()
        .day;
    var newMM = DateTime
        .now()
        .month;
    var newyy = DateTime
        .now()
        .year;
    result = (newDD * newMM * newyy).toString();
    // print(result);

    if (result
        .toString()
        .length < 6) {
      setState(() {
        result = result.toString().padLeft(6, '0');
        // print(result);
      });
    }
  }




  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      //title: Text("My title"),
      content: Container(
        height: 200,
        child: Center(
          child: Column(
            children: [
              Text("Developer Passcode"),
              SizedBox(
                height: 10,
              ),
              PinCodeTextField(
                pinBoxOuterPadding: EdgeInsets.all(8),
                controller: textController,
                hideCharacter: false,
                defaultBorderColor: Color(0xff999999),
                maxLength: 6,
                pinBoxWidth: 50,
                pinBoxHeight: 50,
                pinBoxRadius: 10,
                autofocus: true,
                highlightAnimationBeginColor: Colors.grey,
                pinBoxDecoration:
                ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: TextStyle(fontSize: 22.0),
                pinTextAnimatedSwitcherTransition:
                ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration:
                Duration(milliseconds: 300),
                // highlightAnimation: true,
                highlightAnimationEndColor: Colors.white12,
                keyboardType: TextInputType.number,

                onDone: (text) {
                  print("DONE $text");
                  if(text==result){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Setting()));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Wrong Passcode',style: TextStyle(
                        fontSize: 20,
                      ),),
                      duration: const Duration(seconds: 5),

                    ));
                    textController?.clear();
                    Navigator.pop(context);

                  }



                },


              ),
            ],
          ),
        ),
      ),

    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }




}
