import 'package:flutter/material.dart';
import 'package:follow_me/constants/navigation_constants.dart';
import 'package:get/get.dart';
import '../models/event.dart';
import 'cover_image.dart';

class FmTile extends StatefulWidget {
  final Event event;

  const FmTile(this.event, {super.key});

  @override
  State<FmTile> createState() => _FmTileState();
}

class _FmTileState extends State<FmTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 2, 2, 12),
            child: Card(
                shadowColor: const Color(0xFF232222),
                elevation: 10,
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CoverImage(widget.event.image),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                              icon: isFavorite
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border),
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  //todo aggiornare lo status su firestore
                                  isFavorite = !isFavorite;
                                });
                              }),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            widget.event.location,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(widget.event.location,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 14)),
                    ListTile(
                      title: Text(widget.event.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 25)),
                      subtitle: Text(
                        widget.event.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ))));
  }

  onTap() {
    Get.toNamed(NavigationConstants.EVENT_PAGE,
        arguments: {'event': widget.event});
  }
}
