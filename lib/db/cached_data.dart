
const String dataTable = "my_table";

class CachedDataFields {
  static final List<String> values = [
    id,
    title,
    code,
    cb_price,
    nbu_buy_price,
    nbu_cell_price,
    date
  ];

  static const String id = "_id";
  static const String title = "_title";
  static const String code = "code";
  static const String cb_price = "cb_price";
  static const String nbu_buy_price = "nbu_buy_price";
  static const String nbu_cell_price = "nbu_cell_price";
  static const String date = "date";
}

class CachedDataApi {


  int? id;
  final String title;
  final String code;
  final String cb_price;
  final String nbu_buy_price;
  final String nbu_cell_price;
  final String date;


  CachedDataApi({
    this.id,
    required this.date,
    required this.title,
    required this.cb_price,
    required this.code,
    required this.nbu_buy_price,
    required this.nbu_cell_price
  });



    CachedDataApi copyWith({
    int? id,
    String? title,
    String? code,
    String? cb_price,
    String? nbu_buy_price,
    String? nbu_cell_price,
    String? date,
  }) =>
      CachedDataApi(
        id: id ?? this.id,
        title: title ?? this.title,
        code: code ?? this.code,
        cb_price: cb_price ?? this.cb_price,
        nbu_cell_price: nbu_cell_price ?? this.nbu_cell_price,
        nbu_buy_price: nbu_buy_price ?? this.nbu_buy_price,
        date: date ?? this.date
      );

  static CachedDataApi fromJson(Map<String, Object?>json){
    return CachedDataApi(
        id: json[CachedDataFields.id] as int?,
        nbu_buy_price: json[CachedDataFields.nbu_buy_price] as String,
        nbu_cell_price: json[CachedDataFields.nbu_cell_price] as String,
        cb_price: json[CachedDataFields.cb_price] as String,
        code: json[CachedDataFields.code] as String,
        title: json[CachedDataFields.title] as String,
      date: json[CachedDataFields.date] as String
    );
  }


  Map<String, Object?> toJson() => {
    CachedDataFields.id: id,
    CachedDataFields.title: title,
    CachedDataFields.code: code,
    CachedDataFields.cb_price: cb_price,
    CachedDataFields.nbu_cell_price: nbu_cell_price,
    CachedDataFields.nbu_buy_price: nbu_buy_price,
    CachedDataFields.date: date,
  };

}

