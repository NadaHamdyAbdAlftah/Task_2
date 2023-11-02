
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:task_2/Ui/screens/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_2/data/models/mars_photos.dart';
import '../../data/api/api.dart';
import '../../data/repo/repo.dart';
import '../../utils/routing constants.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});
  dateSelector(BuildContext context) {
    BottomPicker.date(
      title: 'selecte a Date ',
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: const TextStyle(color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 10),
      titleStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.blue
      ),
      onChange: (index) {
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }
  @override
  Widget build(BuildContext context) {
    print("home screen");
    final api = Api() ;
    final localize = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localize.app_title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          SizedBox(
            width: 80.w,
            child: FilledButton(
              onPressed: () => context.push(nasaNews),
              child: Text(
                localize.news,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,
              ),
            ),
          )
          ,
          ElevatedButton(onPressed: () async {
            dateSelector(context);
          }, child: Text("Open Botton Picker"))
        ],),
      drawer: const home_drawer(),
      floatingActionButton:
      FloatingActionButton(onPressed: () async {
        List<Mars_photo>photos = await Repo().fetchPhotos(DateTime(2023,2,1));
        debugPrint(photos.length.toString());
        if (photos.isNotEmpty) {
          debugPrint(photos[0].imgSrc);
        }
      }, child: const Icon(Icons.abc)),

    );
  }
}

