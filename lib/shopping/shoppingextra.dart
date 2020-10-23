import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/extraorder.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  List extraMoqblat = [
    {
      'extra_id': '1',
      'extraName': 'باكيت بطاطس',
      'extraPrice': '10',
      'extraImage': 'images/21.jpg',
    },
    {
      'extra_id': '2',
      'extraName': 'كولسلو',
      'extraPrice': '10',
      'extraImage': 'images/20.jpg',
    },
    {
      'extra_id': '3',
      'extraName': 'صوص جامبو',
      'extraPrice': '7',
      'extraImage': 'images/26.jpg',
    },
  ];
  List extraDrinks = [
    {
      'extra_id': '4',
      'extraName': 'كانز',
      'extraPrice': '10',
      'extraImage': 'images/25.png',
    },
    {
      'extra_id': '5',
      'extraName': 'عصير ليمون نعناع',
      'extraPrice': '10',
      'extraImage': 'images/24.jpg',
    },
  ];
  List extra = [
    {
      'extra_id': '6',
      'extraName': 'جبنه موتزريلا',
      'extraPrice': '10',
      'extraImage': 'images/23.jpeg',
    },
    {
      'extra_id': '7',
      'extraName': 'صوص شيدر',
      'extraPrice': '10',
      'extraImage': 'images/22.jpg',
    },
  ];
  Widget extraorder(List list) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        //  shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, i) {
          return MenuItem(
            extraName: list[i]['extraName'],
            extraImage: list[i]['extraImage'],
            extraPrice: list[i]['extraPrice'],
          );
        },
      ),
    );
  }

  Widget headerBuild() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(15),
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey[100],
                  offset: Offset(0, 1),
                  spreadRadius: 1),
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              color: Colors.red,
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView(
                primary: false,
                //  shrinkWrap: true,
                children: [
                  Text(
                    'المقبلات',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[400]),
                    textAlign: TextAlign.center,
                  ),
                  extraorder(extraMoqblat),
                  Text(
                    'المشروبات',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[500]),
                    textAlign: TextAlign.center,
                  ),
                  extraorder(extraDrinks),
                  Text(
                    "اضافات",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600]),
                    textAlign: TextAlign.center,
                  ),
                  extraorder(extra),
                ],
              ),
            ),
            Positioned(
                height: 70, left: 0, right: 0, top: 0, child: headerBuild()),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height*0.29,
        child: Column(children: [
          Card(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    Text('اجمالي المبلغ'),
                    Expanded(
                      child: Text(''),
                    ),
                    Text('100'),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Text('دليفري'),
                    Expanded(
                      child: Text(''),
                    ),
                    Text('100'),
                  ],
                ),
                  Divider(
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Text('الاجمالي الكلي'),
                    Expanded(
                      child: Text(''),
                    ),
                    Text('100'),
                  ],
                ),
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Column(children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Text(
                  "اضافة الي السلة",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ]),
            height: 40.0,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey[100],
                  offset: Offset(0, 3),
                  spreadRadius: 4),
            ], color: Colors.red, borderRadius: BorderRadius.circular(40)),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 50, right: 30),
            child: Column(children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Text(
                  "تاكيد الطلبيه",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ]),
            height: 40.0,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey[100],
                  offset: Offset(0, 3),
                  spreadRadius: 4),
            ], color: Colors.red, borderRadius: BorderRadius.circular(40)),
          ),
        ]),
      ),
    );
  }
}
