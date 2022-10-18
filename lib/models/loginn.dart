// import 'dart:convert';
// /// status : 400
// /// data : []
// /// otp : 5555
//
// Loginn loginnFromJson(String str) => Loginn.fromJson(json.decode(str));
// String loginnToJson(Loginn data) => json.encode(data.toJson());
// class Loginn {
//   Loginn({
//       num? status,
//       List<dynamic>? data,
//       num? otp,}){
//     _status = status;
//     _data = data;
//     _otp = otp;
// }
//
//   Loginn.fromJson(dynamic json) {
//     _status = json['status'];
//     if (json['data'] != null) {
//       _data = [];
//       json['data'].forEach((v) {
//         _data?.add(Dynamic.fromJson(v));
//       });
//     }
//     _otp = json['otp'];
//   }
//   num? _status;
//   List<dynamic>? _data;
//   num? _otp;
// Loginn copyWith({  num? status,
//   List<dynamic>? data,
//   num? otp,
// }) => Loginn(  status: status ?? _status,
//   data: data ?? _data,
//   otp: otp ?? _otp,
// );
//   num? get status => _status;
//   List<dynamic>? get data => _data;
//   num? get otp => _otp;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     if (_data != null) {
//       map['data'] = _data?.map((v) => v.toJson()).toList();
//     }
//     map['otp'] = _otp;
//     return map;
//   }
//
// }