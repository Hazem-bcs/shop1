import 'package:flutter/material.dart';

SliverGridDelegateWithFixedCrossAxisCount buildGridDelegate() {
  return const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 20,
    crossAxisSpacing: 0,
    mainAxisExtent: 290,
  );
}