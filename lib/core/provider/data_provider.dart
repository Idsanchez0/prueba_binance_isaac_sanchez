import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  dynamic dataUser, dataSymbols;
  get user => dataUser;
  get symbols => dataSymbols;

  void setDataUser(dynamic newData) {
    dataUser = newData;
    notifyListeners();
  }

  void setDataSymbols(dynamic newData) {
    dataSymbols = newData;
    notifyListeners();
  }
}
