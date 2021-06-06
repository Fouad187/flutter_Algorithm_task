import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Models/User.dart';
import 'package:flutter_task/Providers/model_hud.dart';
import 'package:flutter_task/Providers/userData.dart';
import 'package:flutter_task/Screens/Auth/signupScreen.dart';
import 'package:flutter_task/Screens/mainScreen.dart';
import 'package:flutter_task/Services/auth.dart';
import 'package:flutter_task/constant.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static String id='LoginScreenID';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String email,password;
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
        title: Text('Log in' ,style: TextStyle(color: Kstylecolor),),
      ),
      backgroundColor: Color(0xFFECF1FC),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<Modelhud>(context).isChange,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: deviceSize.height*0.15,),
              Form(
                key: _globalKey,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height:deviceSize.height*0.6,
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
                              return 'Please Enter your email';
                            }
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              )
                          ),
                          onChanged: (value){
                            password=value;
                          },
                          obscureText: true,
                          validator: (value){
                            if(value=='')
                              {
                                return 'Please Enter your password';
                              }
                          },
                        ),
                        SizedBox(height: 25,),
                        FlatButton(
                          child: Text('Log in' , style: TextStyle(fontSize: 18),),
                          color: Kstylecolor,
                          minWidth: deviceSize.width*0.8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () async {
                            Auth auth=Auth();
                            User user=User();
                            final instance = Provider.of<Modelhud>(context, listen: false);
                            instance.changeIsLoading(true);
                            print('xxxx');
                            if(_globalKey.currentState.validate())
                              {

                                _globalKey.currentState.save();
                                bool isvalid=EmailValidator.validate(email);
                                if(isvalid)
                                  {
                                    try
                                    {
                                      user=await auth.LoginAndTakeToken(email, password);
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
                        Text('Forget password ?'),
                        SizedBox(height: 30,),
                        Center(child: Text('Don\'t have account ?')),
                        SizedBox(height: 5,),
                        FlatButton(
                          child: Text('Register' , style: TextStyle(color: Colors.white , fontSize: 18),),
                          color: Kbackground,
                          minWidth: deviceSize.width*0.8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                        ),

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
}
