import 'package:intl/intl.dart';
import 'package:follow_me/data/stato_helper.dart';
import 'package:flutter/material.dart';
import 'package:follow_me/data/stato.dart';

class StatiScreen extends StatefulWidget {
  const StatiScreen({Key? key}) : super(key: key);

  @override
  _StatiScreenState createState() => _StatiScreenState();
}

class _StatiScreenState extends State<StatiScreen> {
  late StatoHelper helper;

  @override
  void initState() {
    helper = StatoHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stati'),
      ),
      body: FutureBuilder(
        future: helper.getStati(),
        builder: (context, snapshot) {
          final stati = (snapshot.data == null)
              ? List<Stato>.empty()
              : snapshot.data as List<Stato>;
          return ListView.builder(
              itemCount: stati.length,
              itemBuilder: (context, index) {
                String population = formatPopulation(stati[index].population);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(stati[index].countryCode),
                    backgroundColor: Colors.yellow,
                  ),
                  title: Text(stati[index].countryName),
                  subtitle: Text('Capitale:  ${stati[index].capital} \n' +
                      'Continente: ${stati[index].continentName}\n' +
                      'Popolazione: ${population}'),
                );
              });
        },
      ),
    );
  }

  String formatPopulation(String? population){
    final format = NumberFormat.compact(locale: 'it-it');
    final numero = int.parse(population ?? "0");
    return format.format(numero);
  }

}
