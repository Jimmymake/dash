import 'package:dash_merchant_new/main.dart';
import 'package:dash_merchant_new/mamlakalogo/mamlakalogo.dart';
import 'package:dash_merchant_new/responsiveui/Desktop/mainscreen.dart';
import 'package:dash_merchant_new/responsiveui/Tablet/mainscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();

  bool _isloading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();

    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();

  bool _ispasswordvisible = false;

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    double screeewidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.white10, Colors.white70])),
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: screenheight * 0.5),
                decoration: BoxDecoration(
                    color: Colors.purple.shade600,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(screeewidth, 300),
                    )),
                width: screeewidth,
                height: screenheight * 0.5,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              constraints:
                                  BoxConstraints(minWidth: 250, maxWidth: 460),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.purple.shade600,
                                    width: 1,
                                  )),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        color: Colors.purple.shade600),
                                    child: Center(
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                            fontSize: 27, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      validator: (_email) {
                                        if (_email == null || _email.isEmpty) {
                                          return "Please enter your email";
                                        }
                                        return null;
                                      },
                                      controller: _Emailcontroller,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          labelText: "Enter Email"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      validator: (_password) {
                                        if (_password == null ||
                                            _password.isEmpty) {
                                          return "Please Enter password";
                                        }
                                        return null;
                                      },
                                      obscureText: !_ispasswordvisible,
                                      controller: _Passwordcontroller,
                                      maxLines: 1,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.password),
                                          labelText: "Enter Password",
                                          suffixIcon: IconButton(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      end: 12),
                                              onPressed: () {
                                                setState(() {
                                                  _ispasswordvisible =
                                                      !_ispasswordvisible;
                                                });
                                              },
                                              icon: Icon(_ispasswordvisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off))),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.purple.shade600,
                                            fixedSize: Size(250, 55),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                        onPressed: () {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            setState(() {
                                              _email = _Emailcontroller.text;
                                              _password =
                                                  _Passwordcontroller.text;

                                              // Navigator.push(context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) {f
                                              //   return MobileHomePage();
                                              // }));


                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return LayoutBuilder(
                                                  builder:
                                                      (context, constraints) {
                                                    if (constraints.maxWidth <
                                                        660) {
                                                      return const MobileHomePage();
                                                    } else if (constraints
                                                            .maxWidth <
                                                        1100) {
                                                      return const TabletHomepage();
                                                    } else {
                                                      return DesktopHomePage();
                                                    }
                                                  },
                                                );
                                              }));
                                            });
                                          }
                                        },
                                        child: _isloading
                                            ? const CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Text(
                                                "Log In",
                                                style: TextStyle(
                                                    letterSpacing: 4,
                                                    color: Colors.white),
                                              )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(width: 300, child: mamlakalogo()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
