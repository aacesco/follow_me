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
            padding: const EdgeInsets.fromLTRB(2,2,2,12),
            child: Card(
                shadowColor: const Color(0xFF232222),
                elevation: 10,
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CoverImage(event: widget.event),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Top Row with IconButton
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            icon: isFavorite ?
                                            const Icon(Icons.favorite) : const Icon(
                                                Icons.favorite_border),
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {
                                                isFavorite = !isFavorite;
                                              });
                                              //todo aggiornare lo status su firestore
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                                // Bottom Row with Text
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                                      child: Text(
                                        widget.event.location,
                                        style: const TextStyle(
                                          backgroundColor: Color(0x33FFFFFF),
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                    ListTile(
                      title: Text(widget.event.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 25)),
                      subtitle: Text(widget.event.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,),
                    )
                  ],
                )
            )
        )
    );
  }

  onTap() {
    Get.toNamed(NavigationConstants.EVENT_PAGE, id: 1, arguments: {'event':widget.event});
  }
}
