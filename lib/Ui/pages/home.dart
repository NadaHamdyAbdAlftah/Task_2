import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:task_2/Ui/screens/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/api/api.dart';
import '../../utils/routing constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("home screen");
    final api = Api() ;
    final localize = AppLocalizations.of(context)!;
    return  Scaffold(
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
            child:  FilledButton(
              onPressed: () => context.push(nasaNews),
              child: Text(
                localize.news,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          )
        ],      ),
      drawer: const home_drawer(),
      floatingActionButton:
      FloatingActionButton(onPressed: () {
        api.fetchPhotos(DateTime.now());
      }, child: const Icon(Icons.abc)),

    );
  }
}
