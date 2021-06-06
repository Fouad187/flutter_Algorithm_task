
import 'package:flutter/cupertino.dart';

class Modelhud extends ChangeNotifier
{
  bool isChange = false ;

  changeIsLoading(bool value)
  {
    isChange=value;
    notifyListeners();
  }
}