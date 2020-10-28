import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumbo/pages/shopping/shoppingextra.dart';

class ProductDetail extends StatefulWidget {
  final String prodName;
  final String prodid;
  final String prodimage;

  final String proddesc;
  ProductDetail({
    this.prodName,
    this.proddesc,
    this.prodid,
    this.prodimage,
  });

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int total = 0;
  Widget headerBuild() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Container(
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
        Container(
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
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Shopping()));
              },
            )),
      ]),
    );
  }

  Widget imageBuild() {
    return Hero(
      tag: widget.prodid,
      child: Container(
        //padding: EdgeInsets.all(15),
        //margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
            //  borderRadius: BorderRadius.circular(0),
            image: DecorationImage(
              image: AssetImage(widget.prodimage),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey[100],
                  offset: Offset(0, 1),
                  spreadRadius: 1),
            ]),
      ),
    );
  }

  Widget buttonBuild() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 1,
              color: Colors.grey[100],
              offset: Offset(0, 1),
              spreadRadius: 1),
        ], color: Colors.red, borderRadius: BorderRadius.circular(15)),
        child: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              total += 1;
            });
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '$total',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 1,
              color: Colors.grey[100],
              offset: Offset(0, 1),
              spreadRadius: 1),
        ], color: Colors.red, borderRadius: BorderRadius.circular(15)),
        child: IconButton(
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
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ListView(
                children: [
                  imageBuild(),
                  SizedBox(
                    height: 15,
                  ),
                  buttonBuild(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      widget.prodName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Text(
                          '5',
                          style: TextStyle(fontSize: 16),
                        ),
                        Expanded(
                          child: Text(""),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          '5 review',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      widget.proddesc,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Positioned(
                  height: 120, left: 0, right: 0, top: 0, child: headerBuild()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 50, right: 30),
        child: Row(
          children: [
            Text(
              "1500",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(" "),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey[100],
                        offset: Offset(0, 1),
                        spreadRadius: 1),
                  ],
                  color: Colors.red[200],
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                "اضافة الي السلة",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.shopping_basket,
              color: Colors.white,
            )
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
