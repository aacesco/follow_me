import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import '../models/event.dart';

class CoverImage extends StatefulWidget {
  final Event event;

  const CoverImage(this.event, {super.key});

  @override
  State<CoverImage> createState() => _CoverImageState();
}

class _CoverImageState extends State<CoverImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 100),
      fit: BoxFit.cover,
      placeholder: (context, url) => Image.asset('assets/images/loading_image.gif'),
      imageUrl: widget.event.image,
      errorWidget: (context, url, error) => Image.asset('assets/images/image_not_found.png'),
    );
  }
}
