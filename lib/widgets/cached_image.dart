import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String? ImageUrl;
  CachedImage({super.key, this.ImageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: ImageUrl ??
            'http://startflutter.ir/api/files/f5pm8kntkfuwbn1/hesdw8xm91d17bw/rectangle_64_iEmkWhvcch.png',
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Container(
          color: Colors.yellow,
        ),
        placeholder: (context, url) {
          return Container(
            color: Colors.green,
          );
        },
      ),
    );
  }
}
