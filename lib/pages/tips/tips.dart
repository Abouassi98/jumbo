import 'package:flutter/material.dart';
import 'package:jumbo/account/register.dart';
import '../configs.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  var myarr = [
    {
      'title': 'عشان تكبر جامبو كل ساندوتش جامبو',
      'info': 'ساندوتش جامبو كبير وبيشبع',
      'image': 'images/3.jpeg'
    },
    {
      'title': 'ساندوتش جامبو متقدرش تستغني عنه',
      'info': 'ساندوتش جامبو شكله متقدرش تقاوم اللي جواه',
      'image': 'images/4.jpg'
    },
    {
      'title': 'جامبو يحب اللمه',
      'info': 'اسرع دليفري في طنطا',
      'image': 'images/5.jpg'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height / 6;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 40, right: 30),
                alignment: Alignment.topRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      'دخول',
                      style: TextStyle(color: Colors.red[900], fontSize: 22),
                    ))),
            Expanded(
              child: Container(
                child: PageIndicatorContainer(
                  align: IndicatorAlign.bottom,
                  indicatorColor: Colors.white,
                  indicatorSelectorColor: Colors.red[900],
                  child: PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: myarr.length,
                    itemBuilder: (BuildContext context, i) {
                      return SingleTipes(
                        image: myarr[i]['image'],
                        info: myarr[i]['info'],
                        title: myarr[i]['title'],
                      );
                    },
                  ),
                  length: myarr.length,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: myHeight,
              child: ListView(
                children: [
                  Column(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.red[900],
                          ),
                          child: Text(
                            'انشاء حساب',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.grey[300],
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.facebookSquare,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'متابعه باستخدام الفيسبوك',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleTipes extends StatelessWidget {
  final String image;
  final String title;
  final String info;
  SingleTipes({this.image, this.info, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.red[900],
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 70),
          child: Text(
            info,
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
