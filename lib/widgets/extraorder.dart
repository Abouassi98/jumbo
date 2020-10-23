import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem extends StatefulWidget {
  final String extraName;
  final String extraPrice;
  final String extraImage;
  MenuItem({
    @required this.extraName,
    @required this.extraPrice,
    @required this.extraImage,
  });

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          child: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        ),
        Container(
          child: ListTile(
            title: Text(
              widget.extraName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
            subtitle: Text(
              '${widget.extraPrice} ج',
              style: TextStyle(color: Colors.grey),
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(widget.extraImage),
            ),
            trailing: Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.33,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: Colors.grey[100],
                                offset: Offset(0, 1),
                                spreadRadius: 1),
                          ],
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
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
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: Colors.grey[100],
                                offset: Offset(0, 1),
                                spreadRadius: 1),
                          ],
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
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
            ),
          ),
        ),
      ]),
    );
  }
}
