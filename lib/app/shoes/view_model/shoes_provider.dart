// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/shoes/api_services/api_services.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';
import 'package:provider/provider.dart';

class ShoesProvider with ChangeNotifier {
  List<Shoes> shoesList = [];
  Future<void> fetchShoes(BuildContext context) async {
    ShoesModel resp = await ShoesApiService().fetchProducts(context);

    if (resp.status && resp.shoes.isNotEmpty) {
      shoesList.clear();
      log(resp.toString());
      shoesList.addAll(resp.shoes);
      log('message');
      log(shoesList.toString());

      notifyListeners();
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
