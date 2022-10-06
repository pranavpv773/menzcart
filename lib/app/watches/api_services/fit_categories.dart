import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';

class TshirtFitApiServices {
  Future<TshirtModel> fetchShirtfit(String fit) async {
    log(fit);
    try {
      Response response = await Dio()
          .get("http://10.0.2.2:3000/api/menzclub/t-shirt/fit?tShirt_fit=$fit");
      if (response.statusCode == 200) {
        log('response.data');
        log(response.statusCode.toString());

        return TshirtModel.fromJson(response.data);
      } else {
        return TshirtModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return TshirtModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return TshirtModel(
        tShirt: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
