import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';

class Api{
  late Dio dio ;
  late String apiKey ;
  late String baseUrl ;
  Api(){
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true ,
      ),
    );
   /* dio.interceptors.add(
      RetryInterceptor(dio: dio,
      logPrint: log ,
        retries: 3,
        retryDelays: const[
          Duration(seconds: 1),
          Duration(seconds: 3),
          Duration(seconds: 5) ,

        ] ,
        retryableExtraStatuses: {
        status403Forbidden
        }

      )
    );*/
    apiKey = "AIzaSyAM0xEIGzrwKkZzJmx6txx_9tjFCB5kvFM" ;
    baseUrl ="https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos";
  }


  Future<List<Map<String , double>?>>fetchPhotos(DateTime earthDate)async{
    try{
      Response response = await dio.request(
          baseUrl ,
          options: Options(method: "get") ,
          queryParameters: {
            "earth_date": DateTime.now().toString(),
            "api_key": apiKey
          }
      );
      debugPrint(response.statusCode.toString()) ;
      debugPrint(earthDate.toString()) ;
      debugPrint(response.data.toString());
      return response.data["photos"].cast<Map<String ,double>?>();
    }catch(e){
      if(e is DioException){
        debugPrint("dio error ${e.message}");
      }else{
        debugPrint("normal error${e.toString()}");
      }
      return[];
    }

  }


}
