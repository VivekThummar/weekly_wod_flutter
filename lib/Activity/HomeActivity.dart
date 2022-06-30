import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';
import 'package:weekly_wod_flutter/Constant/StringConstants.dart';
import 'package:weekly_wod_flutter/fragments/HomeFragment.dart';
import 'package:weekly_wod_flutter/fragments/MyPointsFragment.dart';
import 'package:weekly_wod_flutter/fragments/SettingsFragment.dart';
import 'package:weekly_wod_flutter/generated/assets.dart';

class DrawerItem {
  String title;
  Widget icon;

  DrawerItem(this.title, this.icon);
}

class HomeActivity extends StatefulWidget {
  final drawerItems = [
    DrawerItem(
        "Home",
        Image.asset(
          Assets.imagesIcDrawerHome,
          color: ColorConstants.textDarkColor,
        )),
    DrawerItem("My Point", Image.asset(Assets.imagesIcDrawerPoints)),
    DrawerItem("Settings", Image.asset(Assets.imagesIcDrawerSettings)),
    DrawerItem("Profile", Image.asset(Assets.imagesIcDrawerProfile)),
    DrawerItem("Contact us", Image.asset(Assets.imagesIcDrawerNotification)),
    DrawerItem("Sign Out", Image.asset(Assets.imagesIcDrawerContactUs)),
  ];

  HomeActivity({Key? key}) : super(key: key);

  @override
  HomeBodyState createState() {
    return HomeBodyState();
  }
}

class HomeBodyState extends State<HomeActivity> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeFragment();
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
    drawerOptions.add(ListTile(
      leading: Image.asset(
        Assets.imagesIcDrawerSignOut,
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

    return SafeArea(
      child: Scaffold(
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
                  currentAccountPicture: InkWell(
                    child: InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35.0),
                        child: Image.asset(Assets.imagesIcProfileMen,
                            width: 70.0, height: 70.0),
                      ),
                    ),
                  ),
                ),
                Column(children: drawerOptions)
              ],
            ),
          ),
          body: _getDrawerItemWidget(_selectedDrawerIndex),
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
                    Assets.imagesIcHomepageLogo,
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
                Assets.imagesIcDrawer,
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
