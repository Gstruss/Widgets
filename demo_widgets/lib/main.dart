import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Gstruss',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WidgetsPage(),
    );
  }
}

class WidgetsPage extends StatefulWidget {
  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  String userInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DEUTSCHLAND ÜBER ALLES!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center( // Centra todo el contenido dentro del body
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido dentro de la columna
            crossAxisAlignment: CrossAxisAlignment.center, // Centra el contenido horizontalmente
            children: [
              Text(
                'Servus Freund! Esta es una aplicación para traducir cualquier palabra del Español al Alemán',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Centra el texto
              ),
              SizedBox(height: 20),
              Image.network(
                'https://static-cdn.jtvnw.net/jtv_user_pictures/29cc1c06-856c-4346-ad58-2d1d8cba8ea5-profile_image-300x300.png',
                height: 350,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Escribe algo...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    userInput = value; // Capturamos el texto que el usuario escribe
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Dividimos el texto ingresado en palabras
                  List<String> words = userInput.split(' ');

                  // Repetimos la palabra "Rindfleischetikettierungsüberwachungsaufgabenübertragungsgesetz"
                  // tantas veces como palabras haya ingresado el usuario
                  String repeatedText = List.generate(
                    words.length,
                    (_) => 'Rindfleischetikettierungsüberwachungsaufgabenübertragungsgesetz',
                  ).join(''); // Sin espacios entre las repeticiones

                  // Mostramos el mensaje con el texto repetido
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Texto fielmente traducido: $repeatedText')),
                  );
                },
                child: Text('Mostrar traducción'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
