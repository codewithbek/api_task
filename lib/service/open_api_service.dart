import 'package:api_task/models/nbu_model.dart';
import 'package:dio/dio.dart';

class OpenApiService {
  Future<List<NbuModel>> getAllData() async {
    try {
      Response response =
          await Dio().get("https://nbu.uz/en/exchange-rates/json/");
      return (response.data as List?)
              ?.map((category) => NbuModel.fromJson(category))
              .toList() ??
          [];
    } on DioError catch (e) {
      throw e;
    }
  }
}
