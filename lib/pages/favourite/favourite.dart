import 'package:flutter/material.dart';
import 'package:jumbo/pages/product/product_detail.dart';

class Fvourite extends StatefulWidget {
  @override
  _FvouriteState createState() => _FvouriteState();
}

class _FvouriteState extends State<Fvourite> {
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
      {
      "pro_id": "4",
      "pro_name": "وجبة الانتيم",
      "pro_image": "images/20.jpg",
      "pro_desc":
          "الوجبه (  نص كيلو ارز صياديه + ٤ قطع جمبرى هاف جاميو + ٤ قطع فيليه + ٤ قطع كاليماري + بطاطس + صوص كوكتيل + شوربه جمبرى ساده ) 130 جنيه فقط ..."
    },
     {
      "pro_id": "5",
      "pro_name": "عرض العظماء",
      "pro_image": "images/21.jpg",
      "pro_desc":
          "عرض العظماء من جامبو ٣ جمبرى عيش فرنساوي + ٣ بطاطس ١١٠ بدل من ١٥٠  😍"
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
        child: GridView.builder(
          itemCount: products.length,
          itemBuilder: (context, i) => SingleProduct(
            prodDesc: products[i]['pro_desc'],
            prodId: products[i]['pro_id'],
            prodimage: products[i]['pro_image'],
            prodname: products[i]['pro_name'],
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.6),
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
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
               Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(prodimage),
                        )),
                  ),
                ),
              
              Expanded(
                child: Text(
                  prodname,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          
              Row(
                children: [
                  Text(prodId),
                  Expanded(
                    child: Text(''),
                  ),
                  Text(prodId),
                  Icon(Icons.star_border, color: Colors.yellow),
                ],
              ),
            ]),
      ),
    );
  }
}
