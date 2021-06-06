import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Widgets/carcard.dart';
import 'package:flutter_task/Widgets/myappbar.dart';
import 'package:flutter_task/Widgets/mydrawer.dart';
import 'package:flutter_task/Widgets/slide.dart';
import 'package:flutter_task/constant.dart';
import 'package:flutter_task/my_icons_icons.dart';
class MainScreen extends StatelessWidget {
  static String id='MainScreenID';
  @override
  Widget build(BuildContext context) {
    Size deviceSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Color(0xFFF8FAFF),
      drawer: MyDrawer(deviceSize: deviceSize),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Container(
            height: deviceSize.height*0.25,
            color: Color(0xFFF8FAFF),
            child: Card(
              elevation: 1,
              child: CarouselSlider.builder(
                itemCount: cardSlider.length,
                itemBuilder: (context, index, realIndex) {
                  return Slide(image: cardSlider[index].image,);
                },
                options: CarouselOptions(
                  height: deviceSize.height*0.2,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  initialPage: 0,
                  enlargeCenterPage: true,


                ),
              ),

            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: deviceSize.height*0.45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carCardList.length,
              itemBuilder: (context, index) {
                return CarCard(car: carCardList[index],);
              },
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Container(
                    width: deviceSize.width*0.42,
                    height: deviceSize.height*0.1,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Icon(MyIcons.auction , color: Colors.black,),
                        SizedBox(height: 5,),
                        Text('AUCTIONS'),
                      ],
                    ),
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Card(

                  child: Container(
                    width: deviceSize.width*0.42,
                    height: deviceSize.height*0.1,
                    padding: EdgeInsets.all(10),

                    child: Column(
                      children: [
                        Icon(Icons.search , color: Colors.black,),
                        SizedBox(height: 5,),
                        Text('FINDER'),
                      ],
                    ),
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 20 , right: 20),
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                width: deviceSize.width*0.4,
                height: deviceSize.height*0.1,
                child: Column(
                  children: [
                    Icon(Icons.car_rental , color: Colors.black,),
                    SizedBox(height: 5),
                    Text('MY CARS'),
                  ],
                )
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
      bottomNavigationBar: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),)
        ),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home),
              Icon(MyIcons.b3180214),
              Icon(Icons.error),
            ],
          ),
        ),
      ),
    );
  }
}


