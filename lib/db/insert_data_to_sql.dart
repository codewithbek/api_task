import 'package:api_task/db/cached_data.dart';
import 'package:api_task/db/local_database.dart';
import 'package:api_task/service/open_api_client.dart';
import 'package:api_task/service/open_api_service.dart';

class AddData{
   OpenApiService openApiService = OpenApiService(openApiClient: OpenApiClient());

   List<CachedDataApi> malumotlar = [];

  Future<List<CachedDataApi>> getAllCachedList()async{
    LocalDatabase.getInstance;
    var data = await openApiService.getAllData();
    List<CachedDataApi> cachedList = [];
    for(int i = 0; i < data.length; i++){
       cachedList.add(await LocalDatabase.insertCachedTodo(CachedDataApi(
           date: data[i].date,
           title: data[i].title,
           cb_price: data[i].cbPrice,
           code: data[i].code,
           nbu_buy_price: data[i].nbuBuyPrice,
           nbu_cell_price: data[i].nbuCellPrice
       )));
    }
    print("CaCHeddd DAta $cachedList");
    malumotlar = cachedList;
    return cachedList;
  }
}