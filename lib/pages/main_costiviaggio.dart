import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calcola costi viaggio',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CalcolaCostiScreen(),
    );
  }
}

class CalcolaCostiScreen extends StatefulWidget {
  const CalcolaCostiScreen({Key? key}) : super(key: key);

  @override
  State<CalcolaCostiScreen> createState() => _CalcolaCostiScreenState();
}

class _CalcolaCostiScreenState extends State<CalcolaCostiScreen> {
  String tipoPercorso = 'Urbano';
  String messaggio = '';
  final TextEditingController kmController = TextEditingController();
  final List<String> tipiPercorso = ["Urbano", "Extra urbano", "Misto"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Calcola costo del viaggio",
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: kmController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              decoration: InputDecoration(
                  hintText: "Inserisci il numero di KM",
                  hintStyle: TextStyle(fontSize: 18)
              ),
            ),
            const Spacer(),
            DropdownButton<String>(
                value: tipoPercorso,
                items: tipiPercorso.map((String val){
                  return DropdownMenuItem<String>(value: val, child: Text(val,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[800])));
                }).toList(),
                onChanged: (String? nuovoValore) {
                  setState(() {
                    tipoPercorso = nuovoValore!;
                  });
                }
            ),
            const Spacer(flex: 2),
            ElevatedButton(onPressed: (){
              calcolaCosto();
            }, child: Text("Calcola costo",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white))),
            const Spacer(flex: 2),
            Text(messaggio,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800]))
          ],
        ),
      ),
    );
  }

  void calcolaCosto(){
    const costoBenza = 1.80;
    double numKm = double.tryParse(kmController.text) ?? 0;
    double kmTipoPercordo = 1;
    double costo = 0;

    if (tipoPercorso == tipiPercorso[0]){
      kmTipoPercordo = 14;
    } else if(tipoPercorso == tipiPercorso[1]) {
      kmTipoPercordo = 20;
    } else if(tipoPercorso == tipiPercorso[2]) {
      kmTipoPercordo = 16;
    }

    costo =  numKm * costoBenza / kmTipoPercordo;

    setState(() {
      messaggio = "Costo del viaggio ${costo.toString()}";
    });
  }
}

