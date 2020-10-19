import 'package:flutter/material.dart';

class Mydrawrer extends StatefulWidget {
  @override
  _MydrawrerState createState() => _MydrawrerState();
}

class _MydrawrerState extends State<Mydrawrer> {
  Widget drawerIcon({String text, Function func, IconData icon}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: func,
        child: Column(children: <Widget>[
          ListTile(
            title: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            leading: Icon(
              icon,
              color: Colors.red,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
          ),
          Divider(
            color: Colors.grey[500],
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'abouassi',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                accountEmail: Text('mohamedabouassi96@gmail.com',
                    style: TextStyle(color: Colors.grey)),
                currentAccountPicture: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/19.jpg'),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.grey[100]),
              ),
              drawerIcon(
                  text: 'الصفحه الرئيسيه', func: () {}, icon: Icons.home),
              drawerIcon(text: 'حسابي', func: () {}, icon: Icons.person),
              drawerIcon(text: 'مفضلاتي', func: () {}, icon: Icons.favorite),
            ],
          ),
        ),
      ),
    );
  }
}
