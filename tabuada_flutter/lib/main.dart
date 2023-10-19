import 'package:flutter/material.dart';

void main() {
  runApp(TabuadaApp());
}

class TabuadaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabuadaScreen(),
    );
  }
}

class TabuadaScreen extends StatefulWidget {
  @override
  _TabuadaScreenState createState() => _TabuadaScreenState();
}

class _TabuadaScreenState extends State<TabuadaScreen> {
  TextEditingController _numeroController = TextEditingController();
  List<String> resultados = [];

  void calcularTabuada() {
    int numero = int.tryParse(_numeroController.text) ?? 0;

    if (numero != null) {
      setState(() {
        resultados.clear();
        for (int i = 1; i <= 20; i++) {
          resultados.add('$numero x $i = ${numero * i}');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabuada App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Informe um número',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularTabuada,
              child: Text('Calcular Tabuada'),
            ),
            SizedBox(height: 20),
            if (resultados.isNotEmpty)
              Column(
                children: resultados.map((result) => Text(result)).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
