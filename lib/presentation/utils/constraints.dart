import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../widget/custom_images.dart';

const Color primaryColor = Color(0xFF092134);
const Color blackColor = Color(0xFF111111);
const Color grayColor = Color(0xFF7E8BA0);
const Color whiteColor = Color(0xFFFFFFFF);
const Color yellowColor = Color(0xFFF2C94C);
const Color borderColor = Color(0xFFECEAFF);
const Color scaffoldBackground = Color(0xFFECEAFF);
const Color borderWithOpacityColor = Color(0xFFF5F4FF);
const Color redColor = Colors.red;
const Color greenColor = Color(0xFF198754);
const Color transparent = Colors.transparent;

const duration = Duration(seconds: 1);
double radius = 4.0;
BorderRadius borderRadius = BorderRadius.circular(radius);

credentialIcon(String icon) {
  return SizedBox(
    height: 40.0,
    width: 40.0,
    child: Center(
      child: CustomImage(
        path: icon,
        fit: BoxFit.cover,
      ),
    ),
  );
}

void openFullImage(BuildContext context, String imageUrl) {
  print(imageUrl);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl),
              backgroundDecoration: BoxDecoration(color: Colors.black),
              minScale: PhotoViewComputedScale.contained * 1,
              maxScale: PhotoViewComputedScale.covered * 4,
            ),
          ),
        ),
      ),
    ),
  );
}
