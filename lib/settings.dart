import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapps/main.dart';
import 'package:newapps/webview.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            toolbarHeight: MediaQuery
            .of(context)
            .size
            .height / 5,
          backgroundColor: Color(0xff002633),
          title: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Main()));
                },

                  child: Text("Close")),
              SizedBox(width: 10,),
              Text("Setting"),
            ],
          ),
          titleSpacing: 10,
          titleTextStyle: TextStyle(
            color: Colors.white54,
            fontSize: 20
          ),



        ),
        body: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: TabBar(
                        physics: BouncingScrollPhysics(),

                        unselectedLabelColor: Color(0xffFFAD33),
                        labelColor: Color(0xff002633),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(

                            borderRadius: BorderRadius.circular(0),
                            color: Colors.white),

                        tabs: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Gallery",),
                              ),
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Contact Us",),
                              ),
                            ),
                          ),

                        ]),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Color(0xff015574)
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(children: [
                  Center(
                    child: MyWeb3(),
                  ),    Center(
                    child: MyWeb4(),
                  ),
                ]),
              ),
            )

          ],
        ),
      ),
    );
  }
}
