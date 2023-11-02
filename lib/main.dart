import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'package:task_2/utils/AppRouter.dart';
import 'package:task_2/utils/colorScheme.dart';
import 'package:task_2/utils/hive_managment.dart';
import 'package:task_2/utils/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveManagment.initHive() ;
  runApp( MyApp(appRouter:AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp( {super.key ,required this.appRouter});
final AppRouter appRouter ;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("testBox").listenable(),
        builder: (__,box, _){
      bool darkMode = box.get("darkModeValue" ,defaultValue:false) ;
      String language = box.get("languageValue" , defaultValue: "en");
      return Sizer(
        builder:(context , orintation , deviceType){
          return MaterialApp.router(
            title: "NasaNews",
            debugShowCheckedModeBanner: false,
            routerConfig:appRouter.router ,
            themeMode: darkMode ? ThemeMode.dark :ThemeMode.light ,
            theme: ThemeData(
              colorScheme: lightColorScheme,
              textTheme: textTheme ,
              useMaterial3: true ,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              textTheme: textTheme ,
              useMaterial3: true ,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(language),

          );
        },);
        });
  }
}




