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
  final String imgSrc;
  @HiveField(4)
  final String earthDate;


  Mars_photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
  });
  factory Mars_photo.fromJson(Map<String,dynamic>json)=>
      _$Mars_photoFromJson(json) ;


}
@JsonSerializable(createToJson: false)
@HiveType(typeId: 1)
class Camera {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int roverId;
  @HiveField(3)
  final String fullName;

  Camera({required this.id, required this.name,
    required this.roverId, required this.fullName});
factory Camera.fromJson(Map<String , dynamic>json)=>_$CameraFromJson(json) ;


  static _toCapital<String>(data){
    return data.toUpperCase() ;
  }

}


