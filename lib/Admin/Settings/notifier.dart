import 'package:flutter/cupertino.dart';

import 'data.dart';

// class SingleNotifier extends ChangeNotifier {
//   String _currentchoice = choice[0];
//   SingleNotifier();
//   String get currentchoice => _currentchoice;
// }
class SingleNotifier extends ChangeNotifier {
  String _currentchoice = choice[0];
  SingleNotifier();
  String get currentchoice => _currentchoice;
  updatechoice(String value) {
    if (value != _currentchoice) {
      _currentchoice = value;
      notifyListeners();
    }
  }
}
