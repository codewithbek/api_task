import 'package:api_task/models/nbu_model.dart';
import 'package:api_task/repository/nbu_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit({required NbuRepository nbuRepository})
      : _nbuRepository = nbuRepository,
        super(const GetDataState(currencyData: []));

  final NbuRepository _nbuRepository;
  void getCategories() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final currencyData = await _nbuRepository.getAllData();
      emit(state.copyWith(
        currencyData: currencyData,
        status: FormzStatus.submissionSuccess,
      ));
    } on DioError catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorText: error.toString(),
        ),
      );
    }
  }
}
