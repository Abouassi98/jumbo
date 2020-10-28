import 'package:flutter/material.dart';
import 'package:jumbo/pages/product/product_detail.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List products = [
    {
      "pro_id": "1",
      "pro_name": "عرض اللمه من جامبو ...🦀🦞🍤🦐 ",
      "pro_image": "images/17.jpg",
      "pro_desc":
          "وجبه عائليه مكونه من كيلو ارز + ٦ جمبرى هاف جامبو + ٦ فيليه + ٦ كاليمارى + بطاطس فارم + بيبسي لتر + ٣ صوص كوكتيل + ٣ طحينه + ٣ شوربه جمبرى حمرا ساده + ارز ريزو بالجمبرى المقلي + علبه مخلل كل دا 180 جنيه بس ... ",
      "pro_offer": '1',
    },
    {
      "pro_id": "2",
      "pro_name": "عرض الساندوتش الفرنساوي",
      "pro_image": "images/16.jpg",
      "pro_desc":
          "عرض الساندوتش الفرنساوي ٣ ساندوتش فرنساوي + ٣ بطاطس ١١٠ بدل ١٥٠",
      "pro_offer": '0'
    },
    {
      "pro_id": "3",
      "pro_name": "عرض الباستا",
      "pro_image": "images/18.jpg",
      "pro_desc":
          "عرض الباستا اي واحد باستا حجم كبير عليه بطاطس هديه واي ٢ باستا حجم كبير عليهم شوربه جمبري ويسكي هديه ",
      "pro_offer": '0',
    },
    {
      "pro_id": "4",
      "pro_name": "وجبة الانتيم",
      "pro_image": "images/20.jpg",
      "pro_desc":
          "الوجبه (  نص كيلو ارز صياديه + ٤ قطع جمبرى هاف جاميو + ٤ قطع فيليه + ٤ قطع كاليماري + بطاطس + صوص كوكتيل + شوربه جمبرى ساده ) 130 جنيه فقط ...",
      "pro_offer": '1',
    },
    {
      "pro_id": "5",
      "pro_name": "عرض العظماء",
      "pro_image": "images/21.jpg",
      "pro_desc":
          "عرض العظماء من جامبو ٣ جمبرى عيش فرنساوي + ٣ بطاطس ١١٠ بدل من ١٥٠  😍",
      "pro_offer": '0',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'مفضلاتي',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: InkWell(
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, i) => SingleProduct(
            prodDesc: products[i]['pro_desc'],
            prodId: products[i]['pro_id'],
            prodimage: products[i]['pro_image'],
            prodname: products[i]['pro_name'],
            prodoffer: products[i]['pro_offer'],
          ),
        ),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String prodId;
  final String prodname;
  final String prodimage;
  final String prodDesc;
  final String prodoffer;

  SingleProduct(
      {this.prodId,
      this.prodDesc,
      this.prodimage,
      this.prodname,
      this.prodoffer});
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
      child: Directionality(
        textDirection: TextDirection.rtl,
              child: Card(
                child: Container(
                 height: MediaQuery.of(context).size.height * 0.4,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[100],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
              height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(prodimage,),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
              padding:EdgeInsets.only(right: 5) ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          prodname,
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        RichText(
                          
                          overflow: TextOverflow.clip,
                          text: TextSpan(children: [
                            TextSpan(
                                text: prodDesc,
                                style: TextStyle(fontSize: 16, color: Colors.grey))
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      checkOffer(prodoffer ),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkOffer(String prodoffer) {
    return prodoffer == '1'
        ? Container(
          padding: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: Text(
              'عرض',
              style: TextStyle(color: Colors.white),
            ))
        : Container();
  }
}
