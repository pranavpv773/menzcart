// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/order_summary/api_services/api_services_get.dart';
import 'package:menz_cart_app/app/order_summary/model/order_model.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class OrderNotifierTwo with ChangeNotifier {
  List<Order> cartList = [];
  Future<void> fetchUserCart(BuildContext context) async {
    final mail = context.read<UserProvider>().userList[0].userMail;
    OrderResponseModel resp = await OrderGetApiService().fetchCart(mail);

    if (resp.status && resp.orders.isNotEmpty) {
      cartList.clear();
      cartList.addAll(resp.orders);
      notifyListeners();
    } else {
      cartList.clear();
      notifyListeners();
      Fluttertoast.showToast(
        msg: "Your Cart is empty",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
