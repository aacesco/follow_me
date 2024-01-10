import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:follow_me/models/event.dart';

class ArticleDb{
  DatabaseFactory dbFactory = databaseFactoryIo;
  Database? _db;
  final store = intMapStoreFactory.store('articoli');
  static final ArticleDb _singleton = ArticleDb._internal();

  ArticleDb._internal();

  factory ArticleDb() {
    return _singleton;
  }

  Future<Database> init() async {
    _db ??= await _openDb();
    return _db!;
  }

  Future _openDb() async {
    final percorsoDocumenti = await getApplicationDocumentsDirectory();
    final percorsoDb = join(percorsoDocumenti.path, 'articoli.db');
    final db =  await dbFactory.openDatabase(percorsoDb);
    return db;
  }

  Future insertArticle(Event articolo) async {
    int id = await store.add(_db!, articolo.toMap());
    return id;
  }

  Future<List<Event>> retrieveArticles() async {
    if(_db == null) {
      await init();
    }
    final finder = Finder(sortOrders:[
      SortOrder('id')
    ]);
    final articoliSnapshot = await store.find(_db!, finder: finder);

    return articoliSnapshot.map((e) {
      final articolo = Event.fromMap(e.value);
      //articolo.id = e.key;
      return articolo;
    }).toList();
  }

  Future getArticleById(String id) async {
    final finder = Finder(filter: Filter.byKey(id));
    final articoliSnapshot =  await store.find(_db!, finder: finder);

    if(articoliSnapshot.isNotEmpty){
      return Event.fromMap(articoliSnapshot[0].value);
    }
    return Event('', '', '', '', '', '', '', '');
  }

  Future updateArticle(Event articolo) async {
    final finder = Finder(filter: Filter.byKey(articolo.id));
    await store.update(_db!, articolo.toMap(), finder: finder);
  }

  Future deleteArticle(Event articolo) async {
    final finder = Finder(filter: Filter.byKey(articolo.id));
    await store.delete(_db!, finder: finder);
  }

  Future eliminaDatiDb() async {
    await store.delete(_db!);
  }
}