import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'mars_photos.g.dart';
@JsonSerializable(createToJson: false)
@HiveType(typeId: 0)
class Mars_photo {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int sol;
  @HiveField(2)
  final Camera camera;
  @HiveField(3)
  @JsonKey(name:"img_src")
  final String imgSrc;
  @HiveField(4)
  @JsonKey(name: "earth_date" ,fromJson: _fromDate)
  final DateTime earthDate;


  Mars_photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
  });
  factory Mars_photo.fromJson(Map<String,dynamic>json)=>
      _$Mars_photoFromJson(json) ;
  static DateTime _fromDate(String earthDate){
    return DateTime.parse(earthDate);
  }

}
@HiveType(typeId: 1)
@JsonSerializable(createToJson: false)
class Camera {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: "full_name")
  final String fullName;

  Camera({
    required this.id,
    required this.name,
    required this.fullName});
factory Camera.fromJson(Map<String , dynamic>json)=>_$CameraFromJson(json) ;


  static _toCapital<String>(data){
    return data.toUpperCase() ;
  }

}


