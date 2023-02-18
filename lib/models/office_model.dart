class OfficeModel {
  String id;
  String address;
  String image;
  OfficeModel({required this.id, required this.address, required this.image});
  factory OfficeModel.fromJson(Map<String, dynamic> json) {
    return OfficeModel(
        id: json['id'] as String,
        address: json['address'] as String,
        image: json['image'] as String);
  }
}
