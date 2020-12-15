import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';

import 'image_details.dart';

class ImageWidget extends StatelessWidget {
  ImageEntity imageEntity;

  ImageWidget(this.imageEntity);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageEntity.id,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ImageDetails(imageEntity);
            }
          ));
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
    );
  }
}

