import 'package:ecomurse/pages/sign_up.dart';
import 'package:ecomurse/widget/content_model.dart';
import 'package:ecomurse/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(top: 40,left: 20,right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 350,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.5,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 40,),
                        Text(
                          contents[i].title,
                          style: AppWidget.semiboldTextFieldStyle(),
                        ),
                        SizedBox(height: 40,),
                        Text(
                          contents[i].description,
                          style: AppWidget.lightTextFieldStyle(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if(currentIndex==contents.length-1){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
              }
              _controller.nextPage(duration:Duration(microseconds:100), curve: Curves.bounceIn);


            },
            child: Container(
              decoration: BoxDecoration(color: Colors.pinkAccent,borderRadius: BorderRadius.circular(20)),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(child: Text(currentIndex==contents.length-1? "Start":"Next",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
          )
        ],
      ),
    );
  }
  Container buildDot(int index,BuildContext context){
    return Container(
      height: 10,
      width: currentIndex==index?18:7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.black38),
    );

  }
}