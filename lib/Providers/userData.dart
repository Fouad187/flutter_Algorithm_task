import 'package:flutter/cupertino.dart';
import 'package:flutter_task/Models/User.dart';

class UserData extends ChangeNotifier
{
  User user=User(access_token: '');
  void setUser(User userr)
  {
    user=userr;
    notifyListeners();
  }
  User getUser()
  {
    return user;
  }
}