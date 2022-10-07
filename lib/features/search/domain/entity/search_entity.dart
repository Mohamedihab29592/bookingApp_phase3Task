import 'package:equatable/equatable.dart';

class UserSearchEntity extends Equatable {
  final String address;
  final String maxPrice;
  final String minPrice;
  final Map<String, int> ?facilities;
  final String latitude;
  final String longitude;
  final String distance;
  final String name;

  const UserSearchEntity({
    required this.address,
    required this.maxPrice,
    required this.minPrice,
      this.facilities,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.name,
  });

  @override
  List<Object> get props => [
        address,
        maxPrice,
        minPrice,
        // facilities,
        latitude,
        longitude,
        distance,
        name,
      ];
}
