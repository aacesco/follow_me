import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'libroscreen.dart';
import 'libro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LibriScreen(),
    );
  }
}

class LibriScreen extends StatefulWidget {
  const LibriScreen({Key? key}) : super(key: key);

  @override
  State<LibriScreen> createState() => _LibriScreenState();
}

class _LibriScreenState extends State<LibriScreen> {
  Icon icona = const Icon(Icons.search);
  Widget ricerca = const Text('Libri');

  String risultato = '';
  List<Libro> libri = [];

  @override
  void initState() {
    cercaLibri('Oceano mare');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ricerca,
      actions: [
        IconButton(onPressed: () {
          setState(() {
            if(icona.icon == Icons.search){
              icona = const Icon(Icons.cancel);
              ricerca =  TextField(
                onSubmitted: (testoRicerca) => cercaLibri(testoRicerca),
                textInputAction: TextInputAction.search,
                style: TextStyle(color: Colors.white, fontSize: 20)
              );
            } else {
              setState(() {
                icona = const Icon(Icons.search);
                ricerca = const Text('Libri');
              });
            }
          });
        }, icon: icona)
      ]),
      body: ListView.builder(
        itemCount: libri.length,
        itemBuilder: (BuildContext context, int i){
          return Card(
            elevation: 2,
            child: ListTile(
              onTap: (){
                MaterialPageRoute route = MaterialPageRoute(builder: (_) => LibroScreen(libri[i]));
                Navigator.push(context, route);
              },
              leading: libri[i].Copertina != '' ? Image.network(libri[i].Copertina) : const FlutterLogo(),
              title: Text(libri[i].Titolo),
              subtitle: Text(libri[i].Autori),
            ),
          );
        },
      )
    );
  }

  Future cercaLibri(String cerca) async{
    const dominio = 'www.googleapis.com';
    const percorso = '/books/v1/volumes';
    Map<String, dynamic> params = {'q': cerca};
    final Uri url = Uri.https(dominio, percorso, params);

    try {
      http.get(url).then((res) {
        final resJson = json.decode(res.body);
        final libriMap = resJson['items'];
        libri = libriMap.map<Libro>((mappa) => Libro.fromMap(mappa)).toList();
        setState(() {
          risultato = res.body;
          libri = libri;
        });
      });

      setState(() {
        risultato = 'Richiesta in corso';
      });
    } catch(ex){
      setState(() {
        risultato = '';
      });
    }
  }

}
