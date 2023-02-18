import 'package:json_parsing/models/office_model.dart';

class OfficeList {
  List<OfficeModel> listOfInfo;

  OfficeList({required this.listOfInfo});

  factory OfficeList.fromJson(Map<String, dynamic> json) {
    List listOfMaps = json['offices'] as List;
    var listOfOfficeInfo =
        listOfMaps.map((e) => OfficeModel.fromJson(e)).toList();
    return OfficeList(listOfInfo: listOfOfficeInfo);
  }
}
