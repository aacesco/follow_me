import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';

class FmTile extends StatelessWidget {
  final Event event;
  const FmTile(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Padding(padding: const EdgeInsets.all(8),
                child: Image.network(event.image ?? '')),
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite)),
            Text(event.location)
          ],
        ),
        ListTile(
          title: Text(event.title),
          subtitle: Text(event.description),
        )
      ],
    );
  }
}
