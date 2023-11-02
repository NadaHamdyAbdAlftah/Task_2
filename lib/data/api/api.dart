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
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true ,
      ),
    );
    dio.interceptors.add(
      RetryInterceptor(dio: dio,
      logPrint: log ,
        retries: 3,
          retryDelays:const[
          Duration(seconds: 1),
          Duration(seconds: 3),
          Duration(seconds: 5) ,

        ] ,
        retryableExtraStatuses: {
        status403Forbidden
        }

      )
    );
    apiKey = "4Habfg5pVY2wzyBgaPSp1f5qfdV8jp6K1BWKFBKK" ;
    baseUrl ="https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos";
  }


  Future<List<dynamic>>fetchPhotos(String earthDate)async{
    try{
      Response response = await dio.request(
          baseUrl ,
          options: Options(method: "get") ,
          queryParameters: {
            "earth_date": earthDate,
            "api_key": apiKey
          }
      );
      debugPrint("Status code is : ${response.statusCode}") ;
      return response.data["photos"] ;
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
