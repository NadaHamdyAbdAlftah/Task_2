
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_2/Ui/screens/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_2/data/models/mars_photos.dart';
import '../../bloc/mars_photos_cubit.dart';
import '../screens/mars_photo_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int myCurretIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => MarsPhotosCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text(strings.app_title)),
        body: BlocBuilder<MarsPhotosCubit, MarsPhotosState>(
          builder: (context, state) {
            final MarsPhotosCubit cubit = context.read<MarsPhotosCubit>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text("Select Date"),
                  trailing: const Icon(Icons.calendar_month),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: cubit.selectedDate ??
                          DateTime.now().subtract(
                            const Duration(days: 30),
                          ),
                      firstDate: DateTime(2018),
                      lastDate: DateTime.now(),
                    );
                    cubit.changeSelectedDate(selectedDate);
                  },
                  subtitle: cubit.selectedDate != null
                      ? Text(DateFormat.yMMMd().format(cubit.selectedDate!))
                      : null,
                ),
                state is MarsPhotosLoading
                    ? const Center(child: CircularProgressIndicator())
                    : cubit.marsPhotos.isNotEmpty
                    ? Expanded(
                  child: ListView.builder(
                    itemCount: cubit.marsPhotos.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PhotoCard(
                          photo: cubit.marsPhotos[index]);
                    },
                  ),
                )
                    : const Expanded(
                  child: Center(
                    child: Text("There is no photos"),
                  ),
                ),

                ElevatedButton(onPressed: (){
                  ListView.builder(
                    itemCount: cubit.marsPhotos.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PhotoCard(photo: cubit.marsPhotos[index+20]);
                    });
                }, child: Text("show next images")),
                ElevatedButton(onPressed: (){}, child: Text("show privase images"))

              ],
            );
          },
        ),
        drawer: const home_drawer(),
      ),
    );
  }
}





