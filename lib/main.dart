import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

void main() {
  runApp(const MyApp());
}

@Preview(name: 'Laboratorio 1')
Widget myAppPreview()=> const MyApp();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de asistencia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 178, 101)),
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

  Alumno copyWith ({bool? asistencia}){
    return Alumno(
      id: id,
      nombre: nombre,
      carnet: carnet,
      asistencia: asistencia ?? this.asistencia,
    );
  }
}

final List<Alumno> alumnos = ([
  const Alumno(id: '1', nombre: 'José Avilés', carnet: '20245984', asistencia: false),
  const Alumno(id: '2', nombre: 'Roberto Rosales', carnet: '20245894', asistencia: false),
  const Alumno(id: '3', nombre: 'Samuel Merino', carnet: '20245356', asistencia: false),
  const Alumno(id: '4', nombre: 'Antonio Pineda', carnet: '20245653', asistencia: false),
  const Alumno(id: '5', nombre: 'Carlos Cruz', carnet: '20245535', asistencia: false),
  const Alumno(id: '6', nombre: 'Antonio Méndez', carnet: '20245355', asistencia: false),
  const Alumno(id: '7', nombre: 'Adrián López', carnet: '20245259', asistencia: false),
  const Alumno(id: '8', nombre: 'Samuel Pimentel', carnet: '20245952', asistencia: false),
  const Alumno(id: '9', nombre: 'Diego Viscarra', carnet: '20245300', asistencia: false),
  const Alumno(id: '10', nombre: 'Alejandro Pineda', carnet: '20245030', asistencia: false),
  const Alumno(id: '11', nombre: 'Carlos Llanes', carnet: '20245303', asistencia: false),
  const Alumno(id: '12', nombre: 'Samuel Cornejo', carnet: '20245033', asistencia: false),
]);


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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
