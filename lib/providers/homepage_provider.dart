import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, 4];

  void updateValue() {
    int last = numbers.last;

    numbers.add(last + 1);
    notifyListeners();
  }
}
