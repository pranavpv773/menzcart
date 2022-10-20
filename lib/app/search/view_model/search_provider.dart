import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:provider/provider.dart';

class SearchProvider with ChangeNotifier {
  List temp = [];
  bool? onTabLoad = false;
  final searchController = TextEditingController();

  onChangeFunction(BuildContext context) {
    onTabLoad = true;
    notifyListeners();
    if (searchController.text.isEmpty) {
      notifyListeners();
    } else {
      temp.clear();
      for (dynamic i in context.read<ProductsProvider>().allProducts) {
        if (i.name.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ) ||
            (i.category.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ))) {
          temp.add(i);
        }
        notifyListeners();
      }
    }
  }
}
