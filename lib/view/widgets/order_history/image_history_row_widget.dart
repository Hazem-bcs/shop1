import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/function/getImageFromDrive.dart';
import '../order_photo_card_widget.dart';

class ImageHistoryRowWidget extends StatelessWidget {
  const ImageHistoryRowWidget({
    super.key,
    required this.mapList,
  });

  final Map<String, List<String>> mapList;

  @override
  Widget build(BuildContext context) {
    final List<String>? imageList = mapList['imageList'];
    final List<String>? colorList = mapList['colorList'];
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
          width: 150,
          height: 120,
          child: Row(
            children: [
              OrderPhotoCardWidget(
                color: Color(toInt(colorList![0])!),
                image: getImageFromDrive(imageList![0]),
              ),
              if (imageList.length >= 2) ...[
                OrderPhotoCardWidget(
                  flex: 2,
                  color: colorList[1] == colorList[0]
                      ? Color(toInt(colorList[1])!).withOpacity(0.2)
                      : Color(toInt(colorList[1])!),
                  image: getImageFromDrive(imageList[1]),
                )
              ],
              if (imageList.length >= 3) ...[
                // if list.length == 3
                OrderPhotoCardWidget(
                  flex: 3,
                  width: 100,
                  image: getImageFromDrive(imageList[2]),
                  color: Color(toInt(colorList[2])!),
                )
              ]
            ],
          )),
    );
  }
}
