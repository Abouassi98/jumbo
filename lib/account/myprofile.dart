import 'package:flutter/material.dart';
import 'package:jumbo/home/home.dart';

class MyProfile extends StatefulWidget {
  final bool changePassword;
  MyProfile({this.changePassword});
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget formField({String text, Function function}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: TextFormField(
        decoration: InputDecoration(hintText: text, border: InputBorder.none),
        validator: function,
      ),
    );
  }

  Widget passwordField({String text, Function func}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Row(children: <Widget>[
        Expanded(
          child: TextFormField(
            obscureText: true,
            decoration:
                InputDecoration(hintText: text, border: InputBorder.none),
            validator: func,
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 35),
                        child: Text(
                          widget.changePassword
                              ? 'تغير كلمة المرور'
                              : 'تغير الاعدادت الشخصيه',
                          style: TextStyle(color: Colors.red, fontSize: 25),
                        ),
                      ),
                      if (!widget.changePassword)
                        formField(
                            function: (value) {
                              if (value.isEmpty || value.length < 3) {
                                return 'الرجاء ادخال الاسم كامل';
                              }
                            },
                            text: "الاسم الكامل"),
                      if (!widget.changePassword)
                        formField(
                            function: (value) {
                              if (value.isEmpty || !value.contains("@")) {
                                return 'الرجاء ادخال البريد الالكتروني';
                              }
                            },
                            text: "البريد الالكتروني"),
                      passwordField(
                        text: widget.changePassword
                            ? "كلمة المرور الحالية"
                            : 'كلمة المرور',
                        func: (value) {
                          if (value.isEmpty || value.length < 6) {
                            return ' الرجاء ادخال كلمة المرور اكثر من 6 رموز';
                          }
                        },
                      ),
                      if (widget.changePassword)
                        passwordField(
                          text: 'كلمة المرور الجديد',
                          func: (value) {
                            if (value.isEmpty || value.length < 6) {
                              return ' الرجاء ادخال كلمة المرور اكثر من 6 رموز';
                            }
                          },
                        ),
                      if (widget.changePassword)
                        passwordField(
                          text: 'تاكيد كلمة المرور',
                          func: (value) {
                            if (value.isEmpty || value.length < 6) {
                              return ' الرجاء ادخال كلمة المرور اكثر من 6 رموز';
                            }
                          },
                        ),
                      if (!widget.changePassword)
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "رقم الهاتف",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.isEmpty || value.length < 10) {
                                return 'الرجاء ادخال رقم الهاتف';
                              }
                            },
                          ),
                        ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text(
                            'حفظ',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          margin: EdgeInsets.only(top: 30, bottom: 10),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
