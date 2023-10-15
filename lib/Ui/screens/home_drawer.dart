import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class home_drawer extends StatelessWidget {
  const home_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    print("homeDrower screen");
    Box testBox = Hive.box("testBox") ;
    final localize = AppLocalizations.of(context) ;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
          decoration:BoxDecoration(
            color:  Theme.of(context).colorScheme.secondary
          ),
            child: Center(child:
              Text(localize!.app_title ,
              style:Theme.of(context).textTheme.displayMedium,
              ),),),

          ListTile(
            title: Text(localize!.language),
            trailing: DropdownButton<String>(
              value: testBox.get("languageValue" , defaultValue: "en"),
              items:<String>["en", "ar" , "fa"]
             .map(
                         (e) => DropdownMenuItem<String>(
                           value: e,
                            child: Text(e),
                )
                  )
                .toList(),
            onChanged: (locale) => testBox.put("languageValue", locale),
                  focusColor: Colors.blueGrey,
                underline: const SizedBox(),
                   padding: const EdgeInsets.symmetric(horizontal: 8),

            ),

          ),

          ListTile(
            title: Text(localize.theme),
            trailing: Switch(
              value: testBox.get("darkModeValue"),
            onChanged: (value)=>testBox.put("darkModeValue", value),
            ),
          )
          ])

    );
  }
}
