import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Models/User.dart';
import 'package:flutter_task/Providers/model_hud.dart';
import 'package:flutter_task/Providers/userData.dart';
import 'package:flutter_task/Screens/mainScreen.dart';
import 'package:flutter_task/Services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class SignUpScreen extends StatelessWidget {
  static String id='SignUpScreenID';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String name,email,password,address,phone;

  @override
  Widget build(BuildContext context) {
    Size deviceSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Kstylecolor,
        ),
        backgroundColor: Kbackground,
        title: Text('Create an account' ,style: TextStyle(color: Kstylecolor),),
      ),
      backgroundColor: Color(0xFFECF1FC),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<Modelhud>(context).isChange,
        child: Form(
          key:_globalKey,
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              Center(child: Text('Lorem dolor sit amet consectetur'),),
              Center(child: Text('adipisicing elit, sed do.'),),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(15),
                height:deviceSize.height*0.4,
                width: deviceSize.width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF8FAFF),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: (value){
                        name=value;
                      },
                      validator: (value){
                        if(value.isEmpty)
                        {
                          return 'Please Fill your name';
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                      ),
                      onChanged: (value){
                        email=value;
                      },
                      validator: (value){
                        if(value.isEmpty)
                          {
                            return 'Please Fill your email';
                          }
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                      onChanged: (value){
                        password=value;
                      },
                      validator: (value){
                        if(value.isEmpty)
                        {
                          return 'Please Fill your password';
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Center(child: Text('Personal information' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),)),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(15),
                height:deviceSize.height*0.3,
                width: deviceSize.width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF8FAFF),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onChanged: (value){
                        address=value;
                      },
                      validator: (value){
                        if(value.isEmpty)
                        {
                          return 'Please Fill your address';
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                      onChanged: (value){
                        phone=value;
                      },
                      validator: (value){
                        if(value.isEmpty)
                        {
                          return 'Please Fill your phone';
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              FlatButton(
                child: Text('Sign Up' , style: TextStyle(fontSize: 18 , color: Colors.white),),
                color: Kbackground,
                minWidth: deviceSize.width*0.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () async {
                  Auth auth=Auth();
                  User user=User();
                  final instance = Provider.of<Modelhud>(context, listen: false);
                  instance.changeIsLoading(true);
                  if(_globalKey.currentState.validate())
                  {
                    _globalKey.currentState.save();
                    bool isvalid=EmailValidator.validate(email);
                    if(isvalid)
                    {
                      try
                      {
                        user=await auth.SignUp(
                          phone: phone,
                          password: password,
                          email: email ,
                          address: address,
                          name: name,
                        );
                        Provider.of<UserData>(context , listen: false).setUser(user);
                        Navigator.pushNamedAndRemoveUntil(context, MainScreen.id, (route) => false);
                      }
                      catch(e)
                      {
                        print(e.toString());
                      }
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please Enter valid email'))
                      );
                    }
                  }
                  instance.changeIsLoading(false);
                },
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
