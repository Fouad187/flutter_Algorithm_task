import 'package:flutter/material.dart';

import '../constant.dart';
class MyAppBar extends StatelessWidget implements PreferredSizeWidget  {
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Image.asset('images/logo.png'),
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.all(15),
        child: InkWell(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu , color: Kstylecolor,)),
      ),
      backgroundColor: Kbackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.all(15),
            child: Icon(Icons.search , color: Kstylecolor,)),
      ],
    );
  }
}
