import 'dart:convert';

/// status : 200
/// data : [{"id":"23","ref":"1","name":"Baleno Top end","status":"0","type":"SEDAN"},{"id":"24","ref":"1","name":"Wagnor","status":"0","type":"Others"},{"id":"26","ref":"1","name":"1000","status":"0","type":"Others"},{"id":"27","ref":"1","name":"800","status":"0","type":"Others"},{"id":"28","ref":"1","name":"Alto","status":"0","type":"Others"},{"id":"29","ref":"1","name":"A Star","status":"0","type":"Others"},{"id":"30","ref":"1","name":"Alto 800","status":"0","type":"Others"},{"id":"31","ref":"1","name":"Alto K10","status":"0","type":"Others"},{"id":"32","ref":"1","name":"Baleno","status":"0","type":"Others"},{"id":"33","ref":"1","name":"celerio","status":"0","type":"Others"},{"id":"35","ref":"1","name":"Eeco","status":"0","type":"Others"},{"id":"36","ref":"1","name":"Ertiga","status":"0","type":"Others"},{"id":"37","ref":"1","name":"Esteem","status":"0","type":"Others"},{"id":"38","ref":"1","name":"Estilo","status":"0","type":"Others"},{"id":"39","ref":"1","name":"Gypsy","status":"0","type":"Others"},{"id":"40","ref":"1","name":"Ignis","status":"0","type":"Others"},{"id":"41","ref":"1","name":"Kizashi","status":"0","type":"Others"},{"id":"42","ref":"1","name":"Omni","status":"0","type":"Others"},{"id":"43","ref":"1","name":"Ritz","status":"0","type":"Others"},{"id":"44","ref":"1","name":"S Cross","status":"0","type":"Others"},{"id":"45","ref":"1","name":"Swift","status":"0","type":"Others"},{"id":"46","ref":"1","name":"Swift Dzire","status":"0","type":"Others"},{"id":"47","ref":"1","name":"SX4","status":"0","type":"Others"},{"id":"48","ref":"1","name":"Versa","status":"0","type":"Others"},{"id":"49","ref":"1","name":"Vitara Brezza","status":"0","type":"Others"},{"id":"50","ref":"1","name":"Wagon R","status":"0","type":"Others"},{"id":"51","ref":"1","name":"Wagon R Stingray","status":"0","type":"Others"},{"id":"52","ref":"1","name":"Zen","status":"0","type":"Others"},{"id":"53","ref":"1","name":"Zen Estilo","status":"0","type":"Others"},{"id":"54","ref":"1","name":"Ciaz ","status":"0","type":"Others"},{"id":"55","ref":"1","name":"Grand Vitara ","status":"0","type":"Others"},{"id":"503","ref":"1","name":"S Presso","status":"0","type":"Others"},{"id":"504","ref":"1","name":"XL6","status":"0","type":"Others"},{"id":"505","ref":"1","name":"Celerio X","status":"0","type":"Others"},{"id":"506","ref":"1","name":"Jimny","status":"0","type":"Others"},{"id":"552","ref":"1","name":"Swift Hybrid","status":"0","type":"Others"},{"id":"553","ref":"1","name":"Futuro - e","status":"0","type":"Others"},{"id":"554","ref":"1","name":"Alto 2022","status":"0","type":"Others"},{"id":"555","ref":"1","name":"Solio","status":"0","type":"Others"}]
/// otp : 0

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

// String productsModelToJson(ProductsModel data) => json.encode(data.toJson());
class ProductsModel {
  ProductsModel({
    num? status,
    List<Data>? data,
    num? otp,
  }) {
    _status = status;
    _data = data;
    _otp = otp;
  }

  ProductsModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _otp = json['otp'];
  }

  num? _status;
  List<Data>? _data;
  num? _otp;

  ProductsModel copyWith({
    num? status,
    List<Data>? data,
    num? otp,
  }) =>
      ProductsModel(
        status: status ?? _status,
        data: data ?? _data,
        otp: otp ?? _otp,
      );

  num? get status => _status;

  List<Data>? get data => _data;

  num? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['otp'] = _otp;
    return map;
  }
}

/// id : "23"
/// ref : "1"
/// name : "Baleno Top end"
/// status : "0"
/// type : "SEDAN"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? ref,
    String? name,
    String? status,
    String? type,
  }) {
    _id = id;
    _ref = ref;
    _name = name;
    _status = status;
    _type = type;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _ref = json['ref'];
    _name = json['name'];
    _status = json['status'];
    _type = json['type'];
  }

  String? _id;
  String? _ref;
  String? _name;
  String? _status;
  String? _type;

  Data copyWith({
    String? id,
    String? ref,
    String? name,
    String? status,
    String? type,
  }) =>
      Data(
        id: id ?? _id,
        ref: ref ?? _ref,
        name: name ?? _name,
        status: status ?? _status,
        type: type ?? _type,
      );

  String? get id => _id;

  String? get ref => _ref;

  String? get name => _name;

  String? get status => _status;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ref'] = _ref;
    map['name'] = _name;
    map['status'] = _status;
    map['type'] = _type;
    return map;
  }
}
