import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  Widget getTimeLine() {
    return Container(
      color: Colors.grey[50],
      margin: EdgeInsets.only(top: 10, bottom: 80),
      child: Column(
        children: [
          Container(
            height: 80,
            child: TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              indicatorStyle: IndicatorStyle(height: 1.0),
              endChild: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [
                    Text(
                      'تاكيد الطلبيه',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.restaurant,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            child: TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              indicatorStyle: IndicatorStyle(height: 1.0),
              endChild: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [
                    Text(
                      'تجهيز الطلبيه',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.restaurant,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            child: TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              indicatorStyle: IndicatorStyle(height: 1.0),
              endChild: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [
                    Text(
                      'تم تجهيز الطلبية في المطعم',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.restaurant,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            child: TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              indicatorStyle: IndicatorStyle(height: 1.0),
              endChild: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [
                    Text(
                      'الدليفري استلم الطلبية',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.restaurant,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            child: TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              indicatorStyle: IndicatorStyle(height: 1.0),
              endChild: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [
                    Text(
                      'الدليفري قريب من المكان',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.restaurant,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getInfoDelivery() {
    return Container(
      child: ListTile(
        title: Text(
          "الاسم",
        ),
        subtitle: Text(
          "محمد أبوعاصي",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        leading: Container(
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/19.jpg'),
            ),
          ),
        ),
        trailing: Container(
            width: 50,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Icon(Icons.star_border, color: Colors.red),
                    Text(
                      "4.0",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Text("14444", style: TextStyle(color: Colors.grey)),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تتبع الطلبية ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "محادثة",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Icon(Icons.chat, color: Colors.red),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            'الوقت المقدر لاستلام الطلبية',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text('05:30:00',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
              textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Divider(
              color: Colors.grey[200],
            ),
          ),
          getInfoDelivery(),
          getTimeLine(),
        ],
      ),
      bottomNavigationBar: Container(
        child: MaterialButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "الغاء الطلبية",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200]),
          ),
        ),
      ),
    );
  }
}
