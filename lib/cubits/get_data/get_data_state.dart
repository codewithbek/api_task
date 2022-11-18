part of 'get_data_cubit.dart';



class GetDataState extends Equatable {
  const GetDataState({
    required this.currencyData,
    this.errorText = '',
    this.status = FormzStatus.pure,
  });
  final List<NbuModel> currencyData;
  final String errorText;
  final FormzStatus status;

  GetDataState copyWith({
    List<NbuModel>? currencyData,
    String? errorText,
    FormzStatus? status,
  }) =>
      GetDataState(
        currencyData: currencyData ?? this.currencyData,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [currencyData, status, errorText];
}
