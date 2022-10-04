import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/t_shirt/api_services/api_services.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class TshirtProvider with ChangeNotifier {
  TshirtProvider() {
    fetchTShirtFuction();
  }
  List<TShirt> tShirtList = [];
  Future<void> fetchTShirtFuction() async {
    log('Reached');
    TshirtModel resp = await TShirtApiServices().fetchApiTshirts();

    if (resp.status && resp.tShirt.isNotEmpty) {
      tShirtList.clear();
      log(resp.toString());
      tShirtList.addAll(resp.tShirt);
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
