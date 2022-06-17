import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  HomeBodyState createState() {
    return HomeBodyState();
  }
}

class HomeBodyState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff764abc),
                ),
                accountName: Text("Vivek Thummar"),
                accountEmail: Text(""),
                currentAccountPicture: FlutterLogo(),
              ),
              const ListTile(
                leading: Icon(
                  Icons.person,
                ),
                title: Text('Profile'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.mail,
                ),
                title: const Text('Mails'),
                trailing: ClipOval(
                  child: Container(
                    color: const Color(0xff764abc),
                    width: 20,
                    height: 20,
                    child: const Center(
                      child: Text(
                        '11',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.notifications,
                ),
                title: const Text('Notifications'),
                trailing: ClipOval(
                  child: Container(
                    color: const Color(0xff764abc),
                    width: 20,
                    height: 20,
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
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
                    Image.asset(
                      'images/ic_drawer.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
