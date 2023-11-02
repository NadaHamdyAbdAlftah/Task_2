import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_2/data/models/mars_photos.dart';
import 'package:task_2/utils/hive_managment.dart';

import '../api/api.dart';

class Repo {
  late Api _api;

  Repo() {
    _api = Api();
  }

  Future<List<Mars_photo>>fetchPhotos(DateTime earthDate)async{
    bool result = await InternetConnectionChecker().hasConnection ; 
    if(result == true){
      List<dynamic> jsonList = await _api.fetchPhotos(earthDate.toString());
      final photosList = jsonList.map((e) => Mars_photo.fromJson(e)).toList();
      HiveManagment.storeMarsphotos(photosList);
      return photosList ; 
    }else{
      return HiveManagment.getEarthDatePhotos(earthDate);
    }
  }

}

