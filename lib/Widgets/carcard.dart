import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Models/car.dart';
import 'package:flutter_task/constant.dart';
class CarCard extends StatelessWidget {
  Car car;
  CarCard({this.car});
  @override
  Widget build(BuildContext context) {
    Size deviceSize=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: deviceSize.width*0.8,
        height: deviceSize.height*0.47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Kbackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: deviceSize.height*0.23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage(car.image),
                  fit: BoxFit.cover
                )
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(car.name, style: TextStyle(color: Kstylecolor , fontSize: 20 , fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(car.lotanditem, style: TextStyle(color: Colors.white),),
                    SizedBox(height: 5,),
                    Text(car.description , style: TextStyle(color: Colors.white),),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(car.ofman , style: TextStyle(color: Colors.white),),
                          SizedBox(height: 5,),
                          Text('ODO: ${car.odo}' , style: TextStyle(color: Colors.white),),
                        ],),
                        Column(
                          children: [
                            Text('auction start in' , style: TextStyle(color: Kstylecolor),),
                            SizedBox(height: 5,),
                            Container(
                              height: 20,
                              width: deviceSize.width*0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Kstylecolor,
                              ),
                              child: Center(child: Text(car.time)),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
