import 'package:flutter/material.dart';
import 'package:promillo/tabs/main_tab/main_tab.dart';
import 'package:promillo/tabs/permillevalue_tab/permillevalue_tab.dart';
import 'package:promillo/tabs/info_tab/info_tab.dart';
import 'package:promillo/tabs/profile_tab/profile_tab.dart';
import 'package:promillo/tabs/settings_tab/settings_tab.dart';

import 'main_tab/main_tab.dart';

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.supervisor_account)),
                Tab(icon: Icon(Icons.info)),
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.local_drink)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
            backgroundColor: Color(0xff3D3D3D),
            title: Text('Promillo'),
          ),
          body: TabBarView(
            children: [
              ProfileFormWidget(),
              InfoPageWidget(),
              MyDropdownWidget2(),
              MyPermilleValueWidget(),
              MySettingsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
