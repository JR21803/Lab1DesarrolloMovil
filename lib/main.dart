import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

void main() {
  runApp(const MyApp());
}

@Preview(name: 'Laboratorio 1')
Widget myAppPreview() => const MyApp();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de asistencia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 178, 101),
        ),
      ),
      home: const MyHomePage(title: 'Grupo 8 - Control de asistencia'),
    );
  }
}

// Datos alumnos

class Alumno {
  final String id;
  final String nombre;
  final String carnet;
  final bool asistencia;

  const Alumno({
    required this.id,
    required this.nombre,
    required this.carnet,
    required this.asistencia,
  });

  Alumno copyWith({bool? asistencia}) {
    return Alumno(
      id: id,
      nombre: nombre,
      carnet: carnet,
      asistencia: asistencia ?? this.asistencia,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Alumno> alumnos = ([
    const Alumno(
      id: '1',
      nombre: 'José Avilés',
      carnet: '20245984',
      asistencia: false,
    ),
    const Alumno(
      id: '2',
      nombre: 'Roberto Rosales',
      carnet: '20245894',
      asistencia: false,
    ),
    const Alumno(
      id: '3',
      nombre: 'Samuel Merino',
      carnet: '20245356',
      asistencia: false,
    ),
    const Alumno(
      id: '4',
      nombre: 'Antonio Pineda',
      carnet: '20245653',
      asistencia: false,
    ),
    const Alumno(
      id: '5',
      nombre: 'Carlos Cruz',
      carnet: '20245535',
      asistencia: false,
    ),
    const Alumno(
      id: '6',
      nombre: 'Antonio Méndez',
      carnet: '20245355',
      asistencia: false,
    ),
    const Alumno(
      id: '7',
      nombre: 'Adrián López',
      carnet: '20245259',
      asistencia: false,
    ),
    const Alumno(
      id: '8',
      nombre: 'Samuel Pimentel',
      carnet: '20245952',
      asistencia: false,
    ),
    const Alumno(
      id: '9',
      nombre: 'Diego Viscarra',
      carnet: '20245300',
      asistencia: false,
    ),
    const Alumno(
      id: '10',
      nombre: 'Alejandro Pineda',
      carnet: '20245030',
      asistencia: false,
    ),
    const Alumno(
      id: '11',
      nombre: 'Carlos Llanes',
      carnet: '20245303',
      asistencia: false,
    ),
    const Alumno(
      id: '12',
      nombre: 'Samuel Cornejo',
      carnet: '20245033',
      asistencia: false,
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: alumnos.length,
        itemBuilder: (context, index) {
          final alumno = alumnos[index];
          final colorFondo = alumno.asistencia ? Colors.green.shade50 : Colors.red.shade50;
          final colorBorde = alumno.asistencia ? Colors.green : Colors.red;

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              color: colorFondo,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: colorBorde, width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: colorBorde,
                      child: Text(
                        alumno.nombre.substring(0, 1),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            alumno.nombre,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('Carnet: ${alumno.carnet}'),
                          const SizedBox(height: 6),
                          Text(
                            alumno.asistencia ? 'Presente' : 'Ausente',
                            style: TextStyle(
                              color: colorBorde,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: alumno.asistencia,
                      onChanged: (bool value) {
                        setState(() {
                          alumnos[index] = alumno.copyWith(asistencia: value);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
      ),
    );
  }
}
