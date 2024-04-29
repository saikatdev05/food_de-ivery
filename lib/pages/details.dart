import 'package:ecomurse/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            Image.asset(
              "images/salad3.png",
              width: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mediteramean",
                      style: AppWidget.semiboldTextFieldStyle(),
                    ),
                    Text(
                      "Chickpy Salad",
                      style: AppWidget.headLineTextFieldStyle(),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (a > 1) {
                        a--; // Decrease the value of a
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  a.toString(),
                  style: AppWidget.semiboldTextFieldStyle(),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a++; // Increase the value of a
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Text("ISc Bengaluru is the Organising Institute for GATE 2024. GATE 2024 is being conducted by IISc Bengaluru and seven IITs comprising IIT Bombay, IIT Delhi, IIT Guwahati, IIT Kanpur, IIT Kharagpur, IIT Madras, and IIT Roorkee,",maxLines:3,style: AppWidget.lightTextFieldStyle(),),
            SizedBox(height: 30,),
            Row(
              children: [
                Text("Delivery Time",style: AppWidget.semiboldTextFieldStyle(),),
                SizedBox(height: 25,),
                Icon(Icons.alarm,color: Colors.black,),
                SizedBox(height: 5,),
                Text("30 minutes",style: AppWidget.semiboldTextFieldStyle(),),


              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price",style: AppWidget.semiboldTextFieldStyle(),),
                      Text("\$30",style: AppWidget.semiboldTextFieldStyle(),),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize:18,fontFamily: 'popins' ),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.grey,borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(Icons.shopping_bag_outlined,color: Colors.white,),

                      ),
                        SizedBox(width: 10,),

                    ],),

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
