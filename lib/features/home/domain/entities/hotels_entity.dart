import 'package:equatable/equatable.dart';

class HotelsEntity extends Equatable {
  final HotelHomeEntity homeEntity;

  const HotelsEntity({
    required this.homeEntity,
  });

  @override
  List<Object> get props => [
        homeEntity,
      ];
}

class HotelHomeEntity extends Equatable {
  final List<DataHotelEntity> data;

  const HotelHomeEntity({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}

class DataHotelEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String rate;
  final List<HotelImages> images;

  const DataHotelEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.rate,
    required this.images,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        price,
        address,
        rate,
        images,
      ];
}

class HotelImages extends Equatable {
  final int id;
  final String hotelID;
  final String image;

  const HotelImages({
    required this.id,
    required this.hotelID,
    required this.image,
  });

  @override
  List<Object> get props => [
        id,
        hotelID,
        image,
      ];
}
