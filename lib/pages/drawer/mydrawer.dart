import 'package:flutter/material.dart';
import 'package:jumbo/pages/account/myprofile.dart';
import 'package:jumbo/pages/favourite/favourite.dart';
import 'package:jumbo/pages/product/category.dart';

class Mydrawrer extends StatefulWidget {
  @override
  _MydrawrerState createState() => _MydrawrerState();
}

class _MydrawrerState extends State<Mydrawrer> {
  Widget drawerIcon({String text, Function func, IconData icon}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(children: <Widget>[
        InkWell(
          onTap: func,
          child: ListTile(
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
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
          ),
          child: Divider(
            color: Colors.grey[500],
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
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
              drawerIcon(
                  text: 'قائمه الماكولات',
                  func: () {

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Category()));
                  },
                  icon: Icons.restaurant),
              Theme(
                data: theme,
                child: ExpansionTile(
                  title: Text(
                    'حسابي',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  children: [
                    drawerIcon(
                        text: 'تغير الاعدادت الشخصيه',
                        func: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyProfile(
                                    changePassword: false,
                                  )));
                        },
                        icon: Icons.settings),
                    drawerIcon(
                        text: 'تغير كلمة المرور',
                        func: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyProfile(
                                    changePassword: true,
                                  )));
                        },
                        icon: Icons.settings),
                  ],
                ),
              ),
              drawerIcon(text: 'مفضلاتي', func: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Fvourite()));
              }, icon: Icons.favorite),
              drawerIcon(text: 'طلباتي', func: () {}, icon: Icons.history),
              drawerIcon(text: 'من نحن', func: () {}, icon: Icons.message),
              drawerIcon(text: 'مركو الدعم', func: () {}, icon: Icons.call),
            ],
          ),
        ),
      ),
    );
  }
}
