import 'package:api_task/db/cached_data.dart';
import 'package:api_task/db/local_database.dart';
import 'package:api_task/models/nbu_model.dart';
import 'package:api_task/service/open_api_service.dart';

class NbuRepository {
  NbuRepository({required OpenApiService openApiService})
      : _openApiService = openApiService;
  final OpenApiService _openApiService;

  Future<List<NbuModel>> getAllData() async => _openApiService.getAllData();

  Future<List<CachedDataApi>> insertAllCachedList(List<NbuModel> currenciesData)async{
    LocalDatabase.getInstance;
    List<CachedDataApi> cachedList = [];
    //await LocalDatabase----
    for(int i = 0; i < currenciesData.length; i++) {
      cachedList.add(await LocalDatabase.insertCachedTodo(CachedDataApi(
          date: currenciesData[i].date,
          title: "${currenciesData[i].title} from data",
          cb_price: currenciesData[i].cbPrice,
          code: currenciesData[i].code,
          nbu_buy_price: currenciesData[i].nbuBuyPrice,
          nbu_cell_price: currenciesData[i].nbuCellPrice
      )));
    }
    return cachedList;
  }

  Future<List<CachedDataApi>> getAllCachedList() async {
    LocalDatabase.getInstance;
    print("get all Cached Data ${LocalDatabase.getAllCachedData()}");
    return await LocalDatabase.getAllCachedData();
  }
}
