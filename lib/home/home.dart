import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jumbo/drawer/mydrawer.dart';
import 'package:jumbo/product/product_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();
  List category = [
    {"cat_id": "1", "cat_name": "الساندوتشات", "cat_image": "images/6.jpg"},
    {"cat_id": "2", "cat_name": "العروض", "cat_image": "images/7.jpg"},
    {"cat_id": "3", "cat_name": "عيش بلدي", "cat_image": "images/8.jpg"},
    {"cat_id": "4", "cat_name": "الوجبات", "cat_image": "images/9.jpg"},
    {"cat_id": "5", "cat_name": "المقبلات", "cat_image": "images/10.jpg"},
    {"cat_id": "6", "cat_name": "المكرونات", "cat_image": "images/11.jpg"},
    {"cat_id": "7", "cat_name": "الطواجن", "cat_image": "images/12.jpg"},
    {"cat_id": "8", "cat_name": "الأرز", "cat_image": "images/13.jpg"},
    {"cat_id": "9", "cat_name": "الشوربات", "cat_image": "images/14.jpg"},
  ];
  List products = [
    {
      "pro_id": "1",
      "pro_name": "عرض اللمه من جامبو ...🦀🦞🍤🦐 ",
      "pro_image": "images/17.jpg",
      "pro_desc":
          "وجبه عائليه مكونه من كيلو ارز + ٦ جمبرى هاف جامبو + ٦ فيليه + ٦ كاليمارى + بطاطس فارم + بيبسي لتر + ٣ صوص كوكتيل + ٣ طحينه + ٣ شوربه جمبرى حمرا ساده + ارز ريزو بالجمبرى المقلي + علبه مخلل كل دا 180 جنيه بس ... "
    },
    {
      "pro_id": "2",
      "pro_name": "عرض الساندوتش الفرنساوي",
      "pro_image": "images/16.jpg",
      "pro_desc":
          "عرض الساندوتش الفرنساوي ٣ ساندوتش فرنساوي + ٣ بطاطس ١١٠ بدل ١٥٠"
    },
    {
      "pro_id": "3",
      "pro_name": "عرض الباستا",
      "pro_image": "images/18.jpg",
      "pro_desc":
          "عرض الباستا اي واحد باستا حجم كبير عليه بطاطس هديه واي ٢ باستا حجم كبير عليهم شوربه جمبري ويسكي هديه "
    },
    //   {
    //   "pro_id": "4",
    //   "pro_name": "وجبة الانتيم",
    //   "pro_image": "images/20.jpg",
    //   "pro_desc":
    //       "الوجبه (  نص كيلو ارز صياديه + ٤ قطع جمبرى هاف جاميو + ٤ قطع فيليه + ٤ قطع كاليماري + بطاطس + صوص كوكتيل + شوربه جمبرى ساده ) 130 جنيه فقط ..."
    // },
    //  {
    //   "pro_id": "5",
    //   "pro_name": "عرض العظماء",
    //   "pro_image": "images/21.jpg",
    //   "pro_desc":
    //       "عرض العظماء من جامبو ٣ جمبرى عيش فرنساوي + ٣ بطاطس ١١٠ بدل من ١٥٠  😍"
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyDrawer,
      endDrawer: Mydrawrer(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  'توصيل الطلب الي',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'موقع الزبون',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        _keyDrawer.currentState.openEndDrawer();
                      },
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                          right: 10,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'بحث',
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (BuildContext context, i) {
                    return SingleCategory(
                      catId: category[i]["cat_id"],
                      catImage: category[i]["cat_image"],
                      catName: category[i]["cat_name"],
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, i) {
                      return SingleProduct(
                        prodId: products[i]["pro_id"],
                        prodimage: products[i]["pro_image"],
                        prodname: products[i]["pro_name"],
                        prodDesc: products[i]["pro_desc"],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu, size: 30),
            title: Text('العروض'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 30),
            title: Text('الاشعارات'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            title: Text('حسابي'),
          ),
        ],
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String prodId;
  final String prodname;
  final String prodimage;
  final String prodDesc;

  SingleProduct({this.prodId, this.prodDesc, this.prodimage, this.prodname});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(
                  prodName: prodname,
                  proddesc: prodDesc,
                  prodid: prodId,
                  prodimage: prodimage,
                )));
      },
      child: Hero(
        tag: prodId,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(prodimage),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    prodname,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  prodDesc,
                  style: TextStyle(color: Colors.grey),
                ),
              ]),
        ),
      ),
    );
  }
}

class SingleCategory extends StatelessWidget {
  final String catId;
  final String catName;
  final String catImage;
  SingleCategory({this.catId, this.catName, this.catImage});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.only(right: 15),
        height: MediaQuery.of(context).size.height * 0.15,
        //width:MediaQuery.of(context).size.height * 0.15,
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.height * 0.1,
                //padding: EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        catImage,
                      )),
                  borderRadius: BorderRadius.circular(25),

                  // color: Colors.red[100]
                ),
                // child: Image.asset(
                //   catImage,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 6.0),
              child: Text(
                catName,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
