import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/mars_photos.dart';


class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key, required this.photo});

  final Mars_photo photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5.sp),
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: photo.imgSrc),
            Center(child: Text("SOL: ${photo.sol}")),
            Center(
                child: Text(
                  "Earth Date: ${DateFormat.yMMMMd().format(photo.earthDate)}",
                )),
            Center(child: Text("Camera Name: ${photo.camera.name}")),
          ],
        ),
      ),
    );
  }
}
