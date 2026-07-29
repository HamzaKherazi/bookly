import 'dart:io';

import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? imagePath;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          imagePath = image.path;
        });
        // TODO: Upload to server
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kPrimaryColor, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            image: imagePath != null
                ? DecorationImage(
                    image: FileImage(File(imagePath!)),
                    fit: BoxFit.cover,
                  )
                : const DecorationImage(
                    image: NetworkImage(
                      'https://media.licdn.com/dms/image/v2/D4E03AQH7CysXZr29_A/profile-displayphoto-crop_800_800/B4EZ7Qo_dbJkAM-/0/1781616869558?e=1785974400&v=beta&t=mfWu2wyPVQN4NRdcQPXNE7yIaNIkrU8iSpCtRSYarNQ',
                    ),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.circle,
            border: Border.all(color: kBackgroundColor, width: 3),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
            onPressed: pickImage,
          ),
        ),
      ],
    );
  }
}
