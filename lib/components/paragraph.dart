import 'package:flutter/material.dart';
import 'package:follow_me/utils/enum_helper.dart';
import 'package:get/get.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Paragraph extends StatelessWidget {
  final String header;
  final String content;
  final Icon? icon;
  final bool? requiresLocalisation;
  const Paragraph(this.header, this.content,
      {super.key, this.icon, this.requiresLocalisation});

  @override
  Widget build(BuildContext context) {
    if (content.isBlank!) {
      return const SizedBox(
        height: 0,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 12),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(header,
                  style: const TextStyle(
                      color: Color(0x9E575758),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              if (requiresLocalisation ?? false)
                Text(EnumHelper.getLocalizedValue(context, content)),
              if (requiresLocalisation == null || requiresLocalisation == false)
              MarkdownBody(
                  data: content.replaceAll("\\n", "\n"),
                  selectable: true,
                  onTapLink: (text, href, title) {
                    launchUrlString(href!);
                  },
                  bulletBuilder: (index, bulletStyle) {
                    if (index == 0) {
                      return const Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      );
                    }
                    return const Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 20,
                    );
                  },
                  styleSheet: MarkdownStyleSheet(
                    h1: TextStyle(fontSize: 24),
                    h2: TextStyle(fontSize: 20),
                    a: TextStyle(color: Colors.blue),
                  )),
              /*ReadMoreText(
                content.replaceAll("\\n", "\n"),
                style: const TextStyle(fontSize: 20),
                trimLines: 6,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )*/
            ],
          )),
          if (icon != null) icon!,
        ],
      ),
    );
  }
}
