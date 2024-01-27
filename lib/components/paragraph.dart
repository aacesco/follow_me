import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Paragraph extends StatelessWidget {
  final String header;
  final String content;
  final Icon? icon;
  const Paragraph(this.header, this.content, {super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 2, bottom: 12),
      child: Row(
        children: [
          Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(header,
                      style: const TextStyle(
                          color: Color(0x9E575758),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                  ),
                  //todo usare markdown per il contenuto
                  ReadMoreText(
                    content,
                    style: const TextStyle(
                        fontSize: 20),
                    trimLines: 6,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
          ),
          if (icon != null)
            icon!,
        ],
      ),
    );
  }
}