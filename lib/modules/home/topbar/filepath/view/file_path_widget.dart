import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilePathWidget extends StatelessWidget {
  const FilePathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      icon: const Icon(
          Icons.add_photo_alternate_outlined, color: Colors.white),
      onPressed: (){},
    );
  }
}
