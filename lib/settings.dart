
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/theme_provider.dart';

import 'constrains/colours.dart';
import 'drawer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool darkMode;
  bool showNotification = false;
  @override
  void initState() {
    super.initState();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    darkMode = themeProvider.getThemeMode() == ThemeModeType.dark;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer:appDrawer(context),
      body: Center(child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // Container(
          //   child: Text("Preferences".toUpperCase(),style: TextStyle(
          //       color: Colors.black87,fontWeight: FontWeight.w500,letterSpacing: 0.3,fontSize: 20
          //   ),),
          // ),
          // Container(
          //     padding: EdgeInsets.only(top: 16, bottom: 4,left: 5,right: 5),
          //     child: IntrinsicHeight(
          //       child: Row(
          //         // mainAxisAlignment: MainAxisAlignment.start,
          //         // crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Expanded(child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text("Show Notification",style: TextStyle(
          //                   fontWeight: FontWeight.w600,fontSize: 16
          //               ),),
          //               Padding(padding: EdgeInsets.fromLTRB(0, 5,0, 0),child: Text("Enable/Disable Mobile Notification",style: TextStyle(),))
          //             ],
          //           )),
          //           VerticalDivider(color: Colors.grey,),
          //           Switch(value: showNotification,activeColor: Colors.blue, onChanged: (value){
          //             setState(() {
          //               showNotification = value;
          //             });
          //
          //           })
          //         ],
          //       ),
          //     )
          // ),


          Container(
              padding: EdgeInsets.only(top: 16, bottom: 4,left: 5,right: 5),
              child: IntrinsicHeight(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dark Mode",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16
                        )),
                        Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0), child: Text("Save battery Power"))
                      ],
                    )),
                    VerticalDivider(color: Colors.grey,),
                    Switch(value: darkMode,activeColor: Colors.blue, onChanged: (value){
                      setState(() {
                        darkMode = value;
                        final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                        themeProvider.setThemeMode(
                            value ? ThemeModeType.dark : ThemeModeType.light);
                      });

                    })
                  ],
                ),
              )
          ),
        ],
      )),
    );
  }
}
AppBar _buildAppBar() {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    // title:
    // title: Row(
    //   mainAxisAlignment:MainAxisAlignment.spaceBetween,
    //   children: [
    //   Icon(
    //     Icons.menu,
    //     color:tdBlack,
    //     size: 30,
    //   ),
    //   Container(
    //     height: 40,
    //     width: 40,
    //     child: ClipRect(
    //       child:Image.asset('assets/profile1.jpg') ,
    //     ),
    //   ),
    // ],),
  );
}