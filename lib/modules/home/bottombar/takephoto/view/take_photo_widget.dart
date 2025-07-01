import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TakePhotoWidget extends StatelessWidget {
  const TakePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: IconButton(
        onPressed: (){},
        icon: const Icon(Icons.camera_alt, color: Colors.white, size: 72),
      ),
    );
  }
}
