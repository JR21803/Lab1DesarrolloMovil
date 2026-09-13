# laboratorio1_asistencia

## Estado y ubicación
El estado se encuentra ubicado en _MyHomePageState y se presenta como late list<Alumno> alumnos; Esta ahí debido a que es el único widget que necesita recordar y tener acceso a los cambios de asistencia de los alumnos y para poder hacer un contador de los presentes.

Si en se hubiera ubicado en otra parte, por ejemplo como estado dentro de la TarjetaAlmno, el contador no se actualizaría. El número de alumnos presentes se calcula recorriendo la lista de alumnos y se encontrara en este nuevo lugar, la lista no se actualizaría.

## Reconstrucción de widgets

Al momento de realizar una registro de asitencia, se reconstruye el build() de _MyHomePageState porque dentro de este método se encuentra el setState que se utiliza para cambiar los estados de los alumnos. No se hizo nada para que no se reconstruyera de más.


## Extracción de componente

Se extrajo TarjetaAlumno que originalmente se había puesto dentro de _MyHomePageState. El criterio por el que se extrajo fue que se necesitaba una clase que se podía reutilizar en otros lugares y al ser 12 registros de alumnos, era necesario que se pudiera reutilizar.

Si se hubiera usado un método en lugar de una clase, TarjetaAlumno seguiría dependiendo de _MyHomePageState y no podría ser reutilizado. Por ejemplo, si en una futura expansión se quisiera utilizar en una nueva pantalla, habría que copiar y crear una nueva clase en lugar de utilizar una clase existente.


## USO DE IA
- Se utilizó para conocer el uso de copyWith() en Flutter. Este método se mencionaba en la guía de diseño de material de flutter.
1. "¿para que es copywith?"

- Se utilizó para la explicación de errores: "Ten en consideracion lo de ia y explica errores:"

1. Error de state.build:
Missing concrete implementation of 'State.build'. Try implementing the missing method, or make the class abstract.

2. Error relacionado con el método build:
The body might complete normally, causing 'null' to be returned, but the return type, 'Widget', is a potentially non-nullable type. Try adding either a return or a throw statement at the end.

3. Error relacionado con TarjetaAlumno:
The method 'TarjetaAlumno' isn't defined for the type '_MyHomePageState'.

4. Errores de sintaxis:
Expected to find ';'.
Expected an identifier.
Unexpected text ';'.

5. Error de declaración de clase:
Classes can't be declared inside other classes. Try moving the class to the top-level.

