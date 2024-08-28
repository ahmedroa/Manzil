import 'package:flutter/material.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewScreen extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const PhotoViewScreen({super.key, required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: goBackWidget(context),
        title: const Text(
          'Photos',
        ),
      ),
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(
          color: Colors.white,
        ),
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }
}
