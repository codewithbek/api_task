import 'package:api_task/models/nbu_model.dart';
import 'package:api_task/service/open_api_service.dart';

class NbuRepository {
  NbuRepository({required OpenApiService openApiService})
      : _openApiService = openApiService;
  final OpenApiService _openApiService;

  Future<List<NbuModel>> getAllData() async => _openApiService.getAllData();
}
