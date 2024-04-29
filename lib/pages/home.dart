import 'package:flutter/material.dart';
import 'package:ecomurse/widget/widget_support.dart';

import 'details.dart'; // Assuming the location of widget_support.dart

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream=false,pizza=false,salad=false,burger=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Saikat",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3)),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Delicious Food",
                style: AppWidget.headLineTextFieldStyle(),
              ),
              Text(
                "Discover and Get Great Food",
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right:20 ),
                child: ShowItem(),
              ),
              SizedBox(height: 30,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 5.0,
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              children: [
                                Image.asset("images/salad2.png",height: 150,width: 150,fit: BoxFit.cover,),
                                Text("Veggi Taco Hash",style: AppWidget.semiboldTextFieldStyle(),),
                                SizedBox(height: 5,),
                                Text("Fresh And Healthy",style: AppWidget.lightTextFieldStyle(),),
                                SizedBox(height: 5,),
                                Text("\$25",style: AppWidget.semiboldTextFieldStyle(),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5.0,
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Image.asset("images/salad3.png",height: 150,width: 150,fit: BoxFit.cover,),
                              Text("Mix Veg Salad",style: AppWidget.semiboldTextFieldStyle(),),
                              SizedBox(height: 5,),
                              Text("Spicy And onion",style: AppWidget.lightTextFieldStyle(),),
                              SizedBox(height: 5,),
                              Text("\$28",style: AppWidget.semiboldTextFieldStyle(),)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("images/salad3.png",height: 120,width: 120,fit: BoxFit.cover,),
                        SizedBox(width: 10.0,),
                        Column(
                          children: [
                            Container(
                                width:MediaQuery.of(context).size.width/2,
                                child: Text("Mediterranean Chickpea Salad",style: AppWidget.semiboldTextFieldStyle(),)),
                            SizedBox(height: 5.0,),
                            Container(
                                width:MediaQuery.of(context).size.width/2,
                                child: Text("Honey goot Cheese",style: AppWidget.lightTextFieldStyle(),)),
                            SizedBox(height: 5.0,),
                            Container(
                                width:MediaQuery.of(context).size.width/2,
                                child: Text("\$30",style: AppWidget.semiboldTextFieldStyle(),))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ShowItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream=true;
            pizza=false;
            salad=false;
            burger=false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: icecream? Colors.black: Colors.white,borderRadius: BorderRadius.circular(9)),
              padding: EdgeInsets.all(9),
              child: Image.asset(
                "images/ice-cream.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream=false;
            pizza=false;
            salad=false;
            burger=true;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: burger? Colors.black: Colors.white,borderRadius: BorderRadius.circular(9)),
              padding: EdgeInsets.all(9),
              child: Image.asset(
                "images/burger.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            icecream=false;
            pizza=true;
            salad=false;
            burger=false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: pizza? Colors.black: Colors.white,borderRadius: BorderRadius.circular(9)),
              padding: EdgeInsets.all(9),
              child: Image.asset(
                "images/pizza.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream=false;
            pizza=false;
            salad=true;
            burger=false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: salad? Colors.black: Colors.white,borderRadius: BorderRadius.circular(9)),
              padding: EdgeInsets.all(9),
              child: Image.asset(
                "images/salad.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
