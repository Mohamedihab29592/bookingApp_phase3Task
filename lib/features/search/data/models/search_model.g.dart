// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      data: SearchDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SearchDataModel _$SearchDataModelFromJson(Map<String, dynamic> json) =>
    SearchDataModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataHotelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: json['last_page'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$SearchDataModelToJson(SearchDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'last_page': instance.lastPage,
    };

DataHotelModel _$DataHotelModelFromJson(Map<String, dynamic> json) =>
    DataHotelModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      address: json['address'] as String,
      rate: json['rate'] as String,
      latitude: json['latitude']as String,
      longitude: json['longitude']as String,
      images: (json['hotel_images'] as List<dynamic>)
          .map((e) => SearchHotelImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      facilities: (json['facilities'] as List<dynamic>)
          .map((e) => Searchfacilities.fromJson(e as Map<String, dynamic>))
          .toList(),


    );

Map<String, dynamic> _$DataHotelModelToJson(DataHotelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'address': instance.address,
      'rate': instance.rate,
      'hotel_images': instance.images,
      'facilities': instance.facilities,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

SearchHotelImages _$SearchHotelImagesFromJson(Map<String, dynamic> json) =>
    SearchHotelImages(
      id: json['id'] as int,
      hotelID: json['hotel_id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SearchHotelImagesToJson(SearchHotelImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelID,
      'image': instance.image,
    };


Searchfacilities _$SearchfacilitiesFromJson(Map<String, dynamic> json) =>
    Searchfacilities(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SearchfacilitiesToJson(Searchfacilities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
