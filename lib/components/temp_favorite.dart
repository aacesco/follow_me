import 'package:flutter/material.dart';

class TempFavorite extends StatelessWidget {
  const TempFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return ListView.builder(
      itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {},
          tileColor: index.isOdd ? oddItemColor : evenItemColor,
          title: Text('test $index'),
        );
      },
    );
  }
}
