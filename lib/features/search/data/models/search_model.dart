import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  @JsonKey(name: 'data')
  final SearchDataModel data;

  SearchModel({
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class SearchDataModel {
  @JsonKey(name: 'data')
  final List<DataHotelModel> data;
  @JsonKey(name: 'last_page')
  final int lastPage;
  @JsonKey(name: 'total')
  final int total;

  SearchDataModel({
    required this.data,
    required this.lastPage,
    required this.total,
  });

  factory SearchDataModel.fromJson(Map<String, dynamic> json) =>
      _$SearchDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataModelToJson(this);
}

@JsonSerializable()
class DataHotelModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'price')
  final String price;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'rate')
  final String rate;
  @JsonKey(name: 'longitude')
  final String longitude;
  @JsonKey(name: 'latitude')
  final String latitude;
  @JsonKey(name: 'hotel_images')
  final List<SearchHotelImages> images;
  @JsonKey(name: 'facilities')
  final List<Searchfacilities> facilities;

  DataHotelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.rate,
    required this.images,
    required this.longitude,
    required this.latitude,
    required  this.facilities,
  });

  factory DataHotelModel.fromJson(Map<String, dynamic> json) =>
      _$DataHotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataHotelModelToJson(this);
}

@JsonSerializable()
class SearchHotelImages {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'hotel_id')
  final String hotelID;
  @JsonKey(name: 'image')
  final String image;

  SearchHotelImages({
    required this.id,
    required this.hotelID,
    required this.image,
  });

  factory SearchHotelImages.fromJson(Map<String, dynamic> json) =>
      _$SearchHotelImagesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHotelImagesToJson(this);
}

@JsonSerializable()
class Searchfacilities {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String image;

  Searchfacilities({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Searchfacilities.fromJson(Map<String, dynamic> json) =>
      _$SearchfacilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchfacilitiesToJson(this);
}