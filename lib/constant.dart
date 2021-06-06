
import 'package:flutter/material.dart';
import 'package:flutter_task/Widgets/slide.dart';

import 'Models/car.dart';

const Color Kbackground=Color(0xFF071333);
const Color Kstylecolor=Color(0xFFFFCE00);


const List<Slide> cardSlider=[
  Slide(image: 'images/blackcar.jpg'),
  Slide(image:'images/car2.jpg'),
  Slide(image:'images/whitecar.jpg'),
  Slide(image: 'images/newcars.jpg'),
];


 List<Car> carCardList=[
  Car(
    image: 'images/redtesla.png',
    name: 'Tesla 2021',
    lotanditem: 'Lot/item#32510654/',
    description: 'HALBAN-THE SULTANATE',
    odo: '200,306',
    ofman: 'OF MAN',
    time: '5d : 15h : 20m',
  ),
   Car(
     image: 'images/whitetesla.jpg',
     name: 'White T 2021',
     lotanditem: 'Lot/item#32510302/',
     description: 'MADMAN-THE SULTANATE',
     odo: '600,306',
     ofman: 'OF MAAN',
     time: '2d : 11h : 20m',
   ),
   Car(
     image: 'images/blacktesla.jpg',
     name: 'New B 2020',
     lotanditem: 'Lot/item#32514100/',
     description: 'BAN-THE SULTANATE',
     odo: '300,306',
     ofman: 'OIF MAN',
     time: '4d : 15h : 30m',
   ),
   Car(
     image: 'images/tesla.jpg',
     name: 'New Tesla',
     lotanditem: 'Lot/item#32100494/-',
     description: 'HALMAN-THE SUNDOOO',
     odo: '365,211',
     ofman: 'OFF MAAN',
     time: '3d : 18h : 13m',
   ),
   Car(
     image: 'images/white.jpg',
     name: 'BMTT 2020',
     lotanditem: 'Lot/item#324578654/',
     description: 'HALSAAN-THE SULTAMADE',
     odo: '165,306',
     ofman: 'OFS MAN',
     time: '1d : 3h : 18m',
   ),


 ];