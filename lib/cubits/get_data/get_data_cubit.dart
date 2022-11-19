import 'package:api_task/db/local_database.dart';
import 'package:api_task/models/nbu_model.dart';
import 'package:api_task/repository/nbu_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit({required NbuRepository nbuRepository})
      : _nbuRepository = nbuRepository,
        super(const GetDataState(
          currencyData: [],
        )) {
    getCategories();
  }

  final NbuRepository _nbuRepository;

  void getCategories() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await LocalDatabase.deleteAllCachedData();
      emit(state.copyWith(currencyData: []));
      var currencyData = await _nbuRepository.getAllData();
      await _nbuRepository.insertAllCachedList(currencyData);
      emit(state.copyWith(
        currencyData: currencyData,
        status: FormzStatus.submissionSuccess,
        isInternet: 'ONLINE'
      ));
    } on DioError catch (e) {
      getCategoriesFromDB();
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void getCategoriesFromDB() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var cachedData = await _nbuRepository.getAllCachedList();
      emit(state.copyWith(currencyData: []));
      List<NbuModel> currenciesData = [];
      for (int i = 0; i < cachedData.length; i++) {
        currenciesData.add(
          NbuModel(
              date: cachedData[i].date,
              title: cachedData[i].title,
              cbPrice: cachedData[i].cb_price,
              code: cachedData[i].code,
              nbuBuyPrice: cachedData[i].nbu_buy_price,
              nbuCellPrice: cachedData[i].nbu_cell_price,
          ),
        );
      }
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          currencyData: currenciesData,
          isInternet: "OFFLINE",
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
