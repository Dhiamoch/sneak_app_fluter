import 'package:flutter/cupertino.dart';
import 'package:mobile/models/notif_model.dart';
import 'package:mobile/services/notif_service.dart';

class NotifProvider with ChangeNotifier {
  List<NotifModel> _notifs = [];

  List<NotifModel> get notifs => _notifs;

  set notifs(List<NotifModel> notifs) {
    _notifs = notifs;

    notifyListeners();
  }

  Future<void> getNotifs() async {
    try {
      List<NotifModel> notifs = await NotifService().getNotifs();
      _notifs = notifs;
    } catch (e) {
      print(e);
    }
  }
}
