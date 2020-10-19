import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        //  shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(
              list[i]['extraName'],
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Text(
              '${list[i]['extraPrice']} ج',
              style: TextStyle(color: Colors.grey),
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(list[i]['extraImage']),
            ),
            trailing: buttonBuild(),
          );
        },
      ),
    );
  }

  int total = 0;
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

  Widget buttonBuild() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.33,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 1,
                color: Colors.grey[100],
                offset: Offset(0, 1),
                spreadRadius: 1),
          ], color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            iconSize: 16,
            icon: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (total >= 99) {
                  return;
                } else {
                  setState(() {
                    total += 1;
                  });
                }
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '$total',
            style: TextStyle(color: Colors.black, fontSize: 19),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 1,
                color: Colors.grey[100],
                offset: Offset(0, 1),
                spreadRadius: 1),
          ], color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            iconSize: 16,
            icon: FaIcon(
              FontAwesomeIcons.minus,
              color: Colors.white,
            ),
            onPressed: () {
              if (total <= 0) {
                return;
              } else {
                setState(() {
                  total -= 1;
                });
              }
            },
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            primary: false,
            //  shrinkWrap: true,
            children: [
              headerBuild(),
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
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 50, right: 30),
        child: Row(
          children: [
            Text(
              "1000",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(2)),
            Text(
              "المجموع",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Text(" "),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(children: [
                Text(
                  "اضافة الي السلة",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.all(2)),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )
              ]),
            ),
          ],
        ),
        height: 75.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey[100],
                  offset: Offset(0, 3),
                  spreadRadius: 4),
            ],
            //color: Colors.red[300],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.red,
                  Colors.red[300],
                  Colors.red[300],
                  Colors.red,
                ]),
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
