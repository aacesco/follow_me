import 'package:flutter/material.dart';
import 'libro.dart';

class LibroScreen extends StatelessWidget {
  final Libro libro;
  const LibroScreen(this.libro, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(libro.Titolo),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(8),
              child: Image.network(libro.Copertina),),
              Padding(padding: const EdgeInsets.all(8),
                child: Text('Scritto da: ${libro.Autori}',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary
                ),),),
              Padding(padding: const EdgeInsets.all(8),
                child: Text('Editore: ${libro.Editore}',
                style: const TextStyle(fontSize: 16),),),
              Padding(padding: const EdgeInsets.all(8),
                child: Text(libro.Descrizione),),
            ],
          ),
        ),
      ),
    );
  }
}
