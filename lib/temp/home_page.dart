import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';
import 'package:weekly_wod_flutter/fragments/HomeFragment.dart';
import 'package:weekly_wod_flutter/fragments/MyPointsFragment.dart';
import 'package:weekly_wod_flutter/fragments/SettingsFragment.dart';

class DrawerItem {
  String title;
  Widget icon;

  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    DrawerItem(
        "Fragment 1",
        Image.asset(
          'images/ic_drawer_home.png',
          color: ColorConstants.textDarkColor,
        )),
    DrawerItem("Fragment 2", Image.asset('images/ic_drawer_points.png')),
    DrawerItem("Fragment 3", Image.asset('images/ic_drawer_settings.png'),)
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const HomeFragment();
      case 1:
        return const MyPointsFragment();
      case 2:
        return const SettingsFragment();

      default:
        return const Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: d.icon,
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
                accountName: Text("John Doe"), accountEmail: null),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
