import 'package:flutter/material.dart';
import 'package:flutter_task/Models/User.dart';
import 'package:flutter_task/Providers/userData.dart';
import 'package:flutter_task/Screens/Auth/loginScreen.dart';
import 'package:flutter_task/my_icons_icons.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    this.deviceSize,
  });

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    User myUser= Provider.of<UserData>(context).user;
    return Container(
      width: deviceSize.width*0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Kbackground,
      ),
      child: Column(
        children: [
          DrawerHeader(
            child: myUser.access_token=='' ? Center(
              child: Container(
                width: deviceSize.width*0.5,
                decoration: BoxDecoration(
                  color: Kstylecolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FlatButton(
                  child: Text('Log in' , style: TextStyle(fontSize: 18),),
                  onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ),
            ) : Container(
              child: Column(
                children: [
                  Expanded(child: Image.asset('images/account.png')),
                  SizedBox(height: 5,),
                  Text(myUser.name, style: TextStyle(color: Kstylecolor),),
                  Text(myUser.address , style: TextStyle(color: Kstylecolor),),
                ],
              ),
            )
          ),
          SizedBox(height: 10,),
          Divider(
            color: Color(0xFFEEF2FF),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Auctions' , style: TextStyle(color: Kstylecolor),),
                    leading: Icon(MyIcons.auction, color: Kstylecolor,),
                  ),
                  ListTile(
                    title: Text('Current auction' , style: TextStyle(color: Kstylecolor),),
                    leading: Icon(MyIcons.bid__1 , color: Kstylecolor,),
                  ),
                  ListTile(
                    title: Text('Wallet' , style: TextStyle(color: Kstylecolor),),
                    leading: Icon(MyIcons.wallet_1 , color: Kstylecolor,),
                  ),
                  ListTile(
                    title: Text('Saved' , style: TextStyle(color: Kstylecolor),),
                    leading: Icon(MyIcons.b3180214 , color: Kstylecolor,),
                  ),
                  ListTile(
                    title: Text('Won' , style: TextStyle(color: Kstylecolor),),
                    leading: Icon(MyIcons.yes__1 , color: Kstylecolor,),
                  ),
                  ListTile(
                    title: Text('Settings' , style: TextStyle(color: Kstylecolor),),
                    leading: Icon(MyIcons.setting , color: Kstylecolor,),
                  ),
                  ListTile(
                    title: Text('Notifications' , style: TextStyle(color: Kstylecolor),),
                    leading: Icon(MyIcons.notifications , color: Kstylecolor,),
                  ),
                  myUser.access_token=='' ? Container() : ListTile(
                    title: Text('Log out' , style: TextStyle(color: Kstylecolor),),
                    leading: Icon(Icons.logout , color: Kstylecolor,),
                    onTap: (){
                      Provider.of<UserData>(context , listen: false).setUser(User(access_token: ''));
                    },
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
