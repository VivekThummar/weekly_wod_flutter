import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';
import 'package:weekly_wod_flutter/Constant/FontConstant.dart';
import 'package:weekly_wod_flutter/Constant/StringConstants.dart';
import 'package:weekly_wod_flutter/fragments/HomeFragment.dart';
import 'package:weekly_wod_flutter/fragments/MyPointsFragment.dart';
import 'package:weekly_wod_flutter/fragments/SettingsFragment.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  HomeBodyState createState() {
    return HomeBodyState();
  }
}

class DrawerItem {
  String title;
  Widget icon;

  DrawerItem(this.title, this.icon);
}

final drawerItems = [
  DrawerItem(
      "Home",
      Image.asset(
        'images/ic_drawer_home.png',
        color: ColorConstants.textDarkColor,
      )),
  DrawerItem("My Point", Image.asset('images/ic_drawer_points.png')),
  DrawerItem("Settings", Image.asset('images/ic_drawer_settings.png')),
  DrawerItem("Profile", Image.asset('images/ic_drawer_profile.png')),
  DrawerItem("Contact us", Image.asset('images/ic_drawer_notification.png')),
  DrawerItem("Sign Out", Image.asset('images/ic_drawer_contact_us.png')),
];

class HomeBodyState extends State<HomeActivity> {
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

  int _selectedDrawerIndex = 0;

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(ListTile(
        leading: d.icon,
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    drawerOptions.add(ListTile(
      leading: Image.asset(
        'images/ic_drawer_sign_out.png',
        color: ColorConstants.colorRed,
        width: 24,
        height: 24,
      ),
      title: const Text(
        StringConstants.strSignOut,
        style: TextStyle(
            color: ColorConstants.colorRed, fontFamily: 'rubik', fontSize: 13),
      ),
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomToolBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: ColorConstants.themeColor,
                ),
                accountName: const Text("Vivek Thummar"),
                accountEmail: null,
                // currentAccountPicture: FlutterLogo(),
                currentAccountPicture: InkWell(
                  child: InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35.0),
                      child: Image.asset('images/ic_profile_men.png',
                          width: 70.0, height: 70.0),
                    ),
                  ),
                ),
              ),
              Column(children: drawerOptions)
              // ListTile(
              //   onTap: () {
              //     _onSelectItem(0);
              //   },
              //   leading: Image.asset(
              //     'images/ic_drawer_home.png',
              //     color: ColorConstants.textDarkColor,
              //   ),
              //   title: Text(
              //     StringConstants.strHome,
              //     style: FontConstant.regular13TextDark(),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     _onSelectItem(1);
              //   },
              //   leading: Image.asset('images/ic_drawer_points.png'),
              //   title: Text(
              //     StringConstants.strMyPoints,
              //     style: FontConstant.regular13TextDark(),
              //   ),
              // ),
              // ListTile(
              //   leading: Image.asset('images/ic_drawer_settings.png'),
              //   title: Text(
              //     StringConstants.strSettings,
              //     style: FontConstant.regular13TextDark(),
              //   ),
              // ),
              // ListTile(
              //   leading: Image.asset('images/ic_drawer_profile.png'),
              //   title: Text(
              //     StringConstants.strProfile,
              //     style: FontConstant.regular13TextDark(),
              //   ),
              // ),
              // ListTile(
              //   leading: Image.asset('images/ic_drawer_notification.png'),
              //   title: Text(
              //     StringConstants.strNotifications,
              //     style: FontConstant.regular13TextDark(),
              //   ),
              // ),
              // ListTile(
              //   leading: Image.asset('images/ic_drawer_contact_us.png'),
              //   title: Text(
              //     StringConstants.strContactUs,
              //     style: FontConstant.regular13TextDark(),
              //   ),
              // ),
              // ListTile(
              //   leading: Image.asset(
              //     'images/ic_drawer_sign_out.png',
              //     color: ColorConstants.colorRed,
              //     width: 24,
              //     height: 24,
              //   ),
              //   title: const Text(
              //     StringConstants.strSignOut,
              //     style: TextStyle(
              //         color: ColorConstants.colorRed,
              //         fontFamily: 'rubik',
              //         fontSize: 13),
              //   ),
              // ),
            ],
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
        // body: Container(
        //   color: Colors.white,
        //   child: Column(
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       SizedBox(
        //         height: 50,
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: Padding(
        //                     padding: const EdgeInsets.symmetric(vertical: 4.0),
        //                     child: Image.asset(
        //                       'images/ic_homepage_logo.png',
        //                       width: 250,
        //                     ),
        //                   )),
        //               flex: 1,
        //             ),
        //             Builder(builder: (context) {
        //               return InkWell(
        //                 onTap: () {
        //                   Scaffold.of(context).openDrawer();
        //                 },
        //                 child: Image.asset(
        //                   'images/ic_drawer.png',
        //                   width: 24,
        //                   height: 24,
        //                 ),
        //               );
        //             }),
        //             const SizedBox(width: 20),
        //           ],
        //         ),
        //       ),
        //       Expanded(
        //         child: Container(
        //           child: _getDrawerItemWidget(_selectedDrawerIndex),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class CustomToolBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomToolBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ToolBarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class ToolBarState extends State<CustomToolBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Image.asset(
                    'images/ic_homepage_logo.png',
                    width: 250,
                  ),
                )),
            flex: 1,
          ),
          Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                'images/ic_drawer.png',
                width: 24,
                height: 24,
              ),
            );
          }),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
