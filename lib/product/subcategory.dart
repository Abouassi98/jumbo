import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  final String title;
  final String id;
  SubCategory({this.title,this.id});
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  List category = [
    {
      "cat_id": "1",
      "cat_name": "الساندوتشات",
      "cat_image": "images/6.jpg",
      "cat_count": '10'
    },
    {
      "cat_id": "2",
      "cat_name": "العروض",
      "cat_image": "images/7.jpg",
      "cat_count": '10'
    },
    {
      "cat_id": "3",
      "cat_name": "عيش بلدي",
      "cat_image": "images/8.jpg",
      "cat_count": '10'
    },
    {
      "cat_id": "4",
      "cat_name": "الوجبات",
      "cat_image": "images/9.jpg",
      "cat_count": '10'
    },
    {
      "cat_id": "5",
      "cat_name": "المقبلات",
      "cat_image": "images/10.jpg",
      "cat_count": '10'
    },
    {
      "cat_id": "6",
      "cat_name": "المكرونات",
      "cat_image": "images/11.jpg",
      "cat_count": '10'
    },
    {
      "cat_id": "7",
      "cat_name": "الطواجن",
      "cat_image": "images/12.jpg",
      "cat_count": '10'
    },
    {
      "cat_id": "8",
      "cat_name": "الأرز",
      "cat_image": "images/13.jpg",
      "cat_count": '10'
    },
    {
      "cat_id": "9",
      "cat_name": "الشوربات",
      "cat_image": "images/14.jpg",
      "cat_count": '10'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.title,
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
        margin: EdgeInsets.only(top:10),
        child: ListView.builder(
          itemCount: category.length,
          itemBuilder: (BuildContext context, i) {
            return SingleSubCategory(
              catId: category[i]["cat_id"],
              catImage: category[i]["cat_image"],
              catName: category[i]["cat_name"],
              catCount: category[i]["cat_count"],
            );
          },
        ),
      ),
    );
  }
}

class SingleSubCategory extends StatelessWidget {
  final String catId;
  final String catName;
  final String catImage;
  final String catCount;
  SingleSubCategory({this.catId, this.catName, this.catImage, this.catCount});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        child: ListTile(
          leading: FittedBox(
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
              ),
            ),
          ),
          title: Text(
            catName,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            catCount,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
