import 'package:flutter/cupertino.dart';
import '../models/event.dart';

class CoverImage extends StatefulWidget {
  final Event event;

  const CoverImage({super.key, required this.event});

  @override
  State<CoverImage> createState() => _CoverImageState();
}

class _CoverImageState extends State<CoverImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(widget.event.image,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Image.asset('assets/images/loading_image.gif');
        },
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset('assets/images/image_not_found.png');
        }
    );
  }
}
