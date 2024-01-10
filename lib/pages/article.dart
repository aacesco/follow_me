import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../articles_db.dart';
import '../constants/app_constants.dart';
import '../models/event.dart';
import '../pages/spiritual_events_list.dart';

class ArticlePage extends StatefulWidget {
  final Event article;
  final bool isNew;

  const ArticlePage(this.article, this.isNew, {super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final TextEditingController imageCtlr = TextEditingController();
  final TextEditingController titleCtlr = TextEditingController();
  final TextEditingController descriptionCtlr = TextEditingController();
  final TextEditingController categoryCtlr = TextEditingController();
  final TextEditingController locationCtlr = TextEditingController();
  final TextEditingController datesCtlr = TextEditingController();
  final TextEditingController recurringCtlr = TextEditingController();
  final TextEditingController notesCtlr = TextEditingController();
  final TextEditingController audienceCtlr = TextEditingController();
  final TextEditingController typeCtlr = TextEditingController();
  final TextEditingController contactsCtlr = TextEditingController();
  final TextEditingController promoterCtlr = TextEditingController();
  final TextEditingController guideCtlr = TextEditingController();
  final TextEditingController websiteCtlr = TextEditingController();
  final TextEditingController attachmentsCtlr = TextEditingController();

  @override
  void initState() {
   if(!widget.isNew){
     imageCtlr.text = widget.article.image ?? AppConstants.EMPTY;
     titleCtlr.text = widget.article.title;
     descriptionCtlr.text = widget.article.description;
     categoryCtlr.text = widget.article.category;
    // datesCtlr.text = widget.article.dates[0].toString();
     recurringCtlr.text = widget.article.recurring.toString();
     notesCtlr.text = widget.article.notes ?? AppConstants.EMPTY;
     audienceCtlr.text = widget.article.audience ?? AppConstants.EMPTY;
     typeCtlr.text = widget.article.type ?? AppConstants.GENERIC;
     guideCtlr.text = widget.article.guide ?? AppConstants.EMPTY;
     contactsCtlr.text = widget.article.contacts ?? AppConstants.EMPTY;
     promoterCtlr.text = widget.article.promoter ?? AppConstants.EMPTY;
     websiteCtlr.text = widget.article.link ?? AppConstants.EMPTY;
     attachmentsCtlr.text = widget.article.attachments ?? AppConstants.EMPTY;
   }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.article)),
      floatingActionButton: FloatingActionButton(
        onPressed: saveArticle,
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputText(titleCtlr, AppLocalizations.of(context)!.title),
            InputText(descriptionCtlr, AppLocalizations.of(context)!.description),
            InputText(categoryCtlr, AppLocalizations.of(context)!.category),
            InputText(locationCtlr, AppLocalizations.of(context)!.location),
            InputText(notesCtlr, AppLocalizations.of(context)!.notes),
          ],
        ),
      ),
    );
  }

  Future saveArticle() async {
    ArticleDb db = ArticleDb();
    widget.article.title = titleCtlr.text;
    widget.article.description = descriptionCtlr.text;
    widget.article.category = categoryCtlr.text;
    widget.article.location = locationCtlr.text;
    widget.article.notes = notesCtlr.text;


    String id;
    if(widget.isNew){
      id = await db.insertArticle(widget.article);
    } else {
      id = widget.article.id ?? 'fre';
      await db.updateArticle(widget.article);
    }

    Event currentArticle = await db.getArticleById(id);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>  ArticlePage(currentArticle, false)));
  }
}

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const InputText(this.controller, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: label),
      ),
    );
  }
}
