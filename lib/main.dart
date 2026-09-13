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

final List<Alumno> alumnosIniciales = ([
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Alumno> alumnos;

  @override
  void initState() {
    super.initState();
    alumnos = List.of(alumnosIniciales);
  }

  int get _presentes => alumnos.where((a) => a.asistencia).length;

  void marcarTodosPresentes() {
    setState(() {
      for (int i = 0; i < alumnos.length; i++) {
        alumnos[i] = alumnos[i].copyWith(asistencia: true);
      }
    });
  }

  void marcarTodosAusentes() {
    setState(() {
      alumnos = List.of(alumnosIniciales);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Asistencia',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Presentes: $_presentes',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: marcarTodosPresentes,
                    icon: const Icon(Icons.check),
                    label: const Text('Todos presentes'),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: marcarTodosAusentes,
                    icon: const Icon(Icons.close),
                    label: const Text('Todos ausentes'),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: alumnos.length,
              itemBuilder: (context, index) {
                final alumno = alumnos[index];
                return TarjetaAlumno(
                  key: ValueKey(alumno.id),
                  alumno: alumno,
                  onCambiar: (bool value) {
                    setState(() {
                      alumnos[index] = alumno.copyWith(asistencia: value);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TarjetaAlumno extends StatelessWidget {
  final Alumno alumno;
  final ValueChanged<bool> onCambiar;

  const TarjetaAlumno({
    super.key,
    required this.alumno,
    required this.onCambiar,
  });

  @override
  Widget build(BuildContext context) {
    final colorFondo = alumno.asistencia
        ? Colors.green.shade50
        : Colors.red.shade50;
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
                  onCambiar(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
