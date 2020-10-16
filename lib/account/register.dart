import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

  bool _login = false;
  bool _forgetPassword = false;
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
            if (_forgetPassword == true) {
              setState(() {
                _forgetPassword = false;
                _login = false;
              });
            } else {
              Navigator.of(context).pop();
            }
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
                        child: _forgetPassword
                            ? Text(
                                'نسيت كلمة المرور',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 25),
                              )
                            : Text(
                                _login
                                    ? 'سجل الدخول الي حسابك من هنا'
                                    : ' انشاء حساب جديد',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 25),
                              ),
                      ),
                      _forgetPassword
                          ? Container(
                              margin: EdgeInsets.only(bottom: 35),
                              child: Text(
                                'قم بادخال الايميل الصحيح ليتم ارسال كلمة المرور اليك',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 25),
                              ),
                            )
                          : Container(),
                      if (_login == false && _forgetPassword == false)
                        formField(
                            function: (value) {
                              if (value.isEmpty || value.length < 3) {
                                return 'الرجاء ادخال الاسم كامل';
                              }
                            },
                            text: "الاسم الكامل"),
                      formField(
                          function: (value) {
                            if (value.isEmpty || !value.contains("@")) {
                              return 'الرجاء ادخال البريد الالكتروني';
                            }
                          },
                          text: "البريد الالكتروني"),
                      if (_forgetPassword == false)
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'كلمة المرور',
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 6) {
                                    return 'الرجاء ادخال كلمة المرور';
                                  }
                                },
                              ),
                            ),
                            if (_login == true)
                              GestureDetector(
                                child: Text(
                                  'نسيت كلمة المرور',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onTap: () {
                                  setState(() {
                                    _forgetPassword = true;
                                  });
                                },
                              ),
                          ]),
                        ),
                      if (_login == false && _forgetPassword == false)
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
                        onPressed: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: _forgetPassword
                              ? Text(
                                  'ارسال',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                )
                              : Text(
                                  _login ? 'تسجيل جديد' : 'دخول',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                          margin: EdgeInsets.only(top: 30, bottom: 10),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      if (_login == false)
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                              "تطبق الشروط والاحكام انت توافق علي قوانين التطبيق"),
                        )
                    ],
                  ),
                ),
              ),
              _forgetPassword
                  ? Container()
                  : Container(
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "اذا لديك حساب سجل الدخول",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _login = !_login;
                                });
                              },
                              child: Text(
                                _login ? 'تسجيل جديد' : 'دخول',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ),
                          ]),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
