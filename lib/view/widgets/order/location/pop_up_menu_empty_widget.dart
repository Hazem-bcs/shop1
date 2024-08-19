import 'package:flutter/material.dart';

class PopUpMenuEmptyWidget extends StatelessWidget {
  const PopUpMenuEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: Column(
      children: [
        Text(
          "Sorry you don't have a locations in your"
              " list pleas add one add one",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ListTile(
          title: Icon(Icons.add,size: 27,),
        )
      ],
    ));
  }
}