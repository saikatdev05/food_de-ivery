import 'package:ecomurse/pages/bottomnav.dart';
import 'package:ecomurse/pages/forgotpassword.dart';
import 'package:ecomurse/pages/sign_up.dart';
import 'package:ecomurse/widget/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";
  final _formKey = GlobalKey<FormState>();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  userLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        email = userEmailController.text;
        password = userPasswordController.text;
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        // Navigate to BottomNav after successful login
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email", style: TextStyle(fontSize: 18, color: Colors.black))));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password provided by user", style: TextStyle(fontSize: 18, color: Colors.black))));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFff5c30),
                      Color(0xFFe74b1a),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Text(""),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo2.png",
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 50),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text("Login", style: AppWidget.headLineTextFieldStyle()),
                              SizedBox(height: 30,),
                              TextFormField(
                                controller: userEmailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(hintText: 'Email', hintStyle: AppWidget.semiboldTextFieldStyle(), prefixIcon: Icon(Icons.email)),
                              ),
                              SizedBox(height: 30,),
                              TextFormField(
                                controller: userPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(hintText: 'Password', hintStyle: AppWidget.semiboldTextFieldStyle(), prefixIcon: Icon(Icons.password_outlined)),
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                                },
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text("Forget Password?", style: AppWidget.semiboldTextFieldStyle(),),
                                ),
                              ),
                              SizedBox(height: 60,),
                              GestureDetector(
                                onTap: userLogin,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 5.0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    width: 200,
                                    decoration: BoxDecoration(color: Color(0xffff5722,), borderRadius: BorderRadius.circular(20)),
                                    child: Center(child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'poppins', fontWeight: FontWeight.bold),)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text("Don't have an account? Sign up", style: AppWidget.semiboldTextFieldStyle(),)
                    )
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
