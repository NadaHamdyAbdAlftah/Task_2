import 'package:hive_flutter/adapters.dart';
import 'package:task_2/data/models/mars_photos.dart';
import 'package:task_2/utils/constant.dart';

class HiveManagment{
  static Future<void>initHive()async{
    await Hive.initFlutter();
    Hive.registerAdapter(MarsphotoAdapter()) ;
    Hive.registerAdapter(CameraAdapter());

    await Hive.openBox("testBox");
    await Hive.openBox<Mars_photo>(photosBox) ;

  }
  static void storeMarsphotos(List<Mars_photo>marsPhotos){
    for(Mars_photo photo in marsPhotos){
      Hive.box<Mars_photo>(photosBox).put(photo.id, photo) ;
    }
  }
  static List<Mars_photo> getEarthDatePhotos(DateTime earthDate){
    return Hive.box<Mars_photo>(photosBox)
        .values
    .where((element) => earthDate == element.earthDate)
    .toList();
  }

}