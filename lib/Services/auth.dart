import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_task/Models/User.dart';
import 'package:http/http.dart' as http;


class Auth
{
  String baseurl='https://royalazad.herokuapp.com/api/auth/';
  Future<User> LoginAndTakeToken(String email , String password) async
  {

    String url=baseurl+'signin';
    http.Response response;
    try {
      response = await http.post(Uri.parse(url), body:{
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        String json = response.body;
        var data = jsonDecode(json);
        User myuser=User(
          name: data['data']['name'],
          id: data['data']['id'],
          address: data['data']['address'],
          avatar: data['data']['avatar'],
          email: data['data']['email'],
          images: data['data']['images'],
          phone: data['data']['phone'],
          access_token: data['data']['access_token'],
          token_type: data['data']['token_type'],
        );
        return myuser;
      }
      else {
        String json = response.body;
        var data = jsonDecode(json);
       print(data);
      }
    } catch(e)
    {
      return e;
    }
  }

  Future<User> SignUp({String name ,String email , String password,String address, String phone}) async {
    String url=baseurl+'signup';
    http.Response response;
    try {
      response = await http.post(Uri.parse(url), body:{
        'name' : name,
        'email': email,
        'password': password,
        'phone' : phone,
        'address' : address,
        'password_confirmation' : password,
        'avatar' : '',
      });
      if (response.statusCode == 200) {
        String json = response.body;
        var data = jsonDecode(json);
        User myuser=User(
          name: data['user']['name'],
          id: data['user']['id'],
          address: data['user']['address'],
          avatar: data['user']['avatar'],
          email: data['user']['email'],
          phone: data['user']['phone'],
          access_token: data['Bearer_token'],
          token_type: data['token_type'],
        );
        return myuser;
      }
      else {
        String json = response.body;
        var data = jsonDecode(json);
        print(data);
        print('yy');
      }
    } catch(e)
    {
     return e;
    }
  }
}