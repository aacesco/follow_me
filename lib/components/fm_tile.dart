import 'package:flutter/material.dart';
import '../models/event.dart';
import '../pages/event_page.dart';
import 'cover_image.dart';

class FmTile extends StatefulWidget {
  final Event event;

  const FmTile({super.key, required this.event});

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
            padding: const EdgeInsets.all(2),
            child: Card(
                elevation: 5,
                color: const Color(0xFFDAE1E1),
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
                      title: Text(widget.event.title),
                      subtitle: Text(widget.event.description),
                    )
                  ],
                )
            )
        )
    );
  }

  onTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>  EventPage(widget.event)));
  }
}
