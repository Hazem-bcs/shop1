import 'package:flutter/material.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0); // نقطة الانطلاق
    path.lineTo(0, size.height); // الزاوية اليسرى السفلية
    path.quadraticBezierTo(0, size.height-30, 30, size.height - 30); // الانحناء للزاوية اليمنى
    path.lineTo(size.width-30, size.height-30); // الزاوية اليمنى السفلية
    path.quadraticBezierTo(size.width, size.height - 30, size.width, size.height); // الانحناء للزاوية اليمنى
    path.lineTo(size.width, 0); // العودة للأعلى بخط مستقيم
    path.close(); // إغلاق المسار
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
