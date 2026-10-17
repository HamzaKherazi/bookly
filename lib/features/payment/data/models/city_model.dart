class CityModel {
  final int cityId;
  final String name;
  final double shippingCost;

  CityModel({
    required this.cityId,
    required this.name,
    required this.shippingCost,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    cityId: json['city_id'],
    name: json['name'],
    shippingCost: json['shipping_cost'],
  );
}
