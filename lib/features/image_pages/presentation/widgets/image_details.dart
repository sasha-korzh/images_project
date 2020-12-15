import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';

class ImageDetails extends StatelessWidget {
  final ImageEntity imageEntity;

  ImageDetails(this.imageEntity);

  @override
  Widget build(BuildContext context) {
    var parentHeight = MediaQuery.of(context).size.height;
    var parentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          width: parentWidth,
          height: parentHeight * 0.5,
          child: Hero(
            tag: imageEntity.id,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CachedNetworkImage(
                imageUrl: imageEntity.url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                placeholder: (context, url) => Icon(Icons.image),
                errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
              ),
            ),
          )
        ),
      )
    );
  }
}