import 'package:flutter/material.dart';

const Color colorClientePar = Color(0xffc3a1ef);
const Color colorClienteImpar = Color(0xff69b2e1);

class Cliente {
  final int idCliente;
  final String nombre;
  final String direccion;
  final String telefono;
  final String correo;
  final int idMascota;

  Cliente({
    required this.idCliente,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.correo,
    required this.idMascota,
  });

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      idCliente: map['id_cliente'],
      nombre: map['nombre'],
      direccion: map['direccion'],
      telefono: map['telefono'],
      correo: map['correo'],
      idMascota: map['id_mascota'],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Cliente> clientes = [
      Cliente.fromMap({
        'id_cliente': 22308051281162,
        'nombre': 'Frida Abril Cisneros Hernandez',
        'direccion': 'Calle 123',
        'telefono': '6561234567',
        'correo': 'frida@corro.com',
        'id_mascota': 110201,
      }),
      Cliente.fromMap({
        'id_cliente': 2,
        'nombre': 'María García',
        'direccion': 'Avenida Secundaria 456',
        'telefono': '555-5678',
        'correo': 'maria@example.com',
        'id_mascota': 102,
      }),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Clientes')),
        body: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: clientes.map((cliente) {
                  return Column(
                    children: [
                      _buildClienteCard(
                        cliente,
                        clientes.indexOf(cliente) % 2 == 0
                            ? colorClientePar
                            : colorClienteImpar,
                        constraints.maxWidth, // Usar el ancho máximo disponible
                      ),
                      if (cliente != clientes.last) SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildClienteCard(
      Cliente cliente, Color backgroundColor, double maxWidth) {
    return Card(
      elevation: 5,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        // Usar Container para establecer el ancho
        width: maxWidth * 0.8, // O un porcentaje del ancho máximo
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${cliente.idCliente}'),
            Text('Nombre: ${cliente.nombre}'),
            Text('Dirección: ${cliente.direccion}'),
            Text('Teléfono: ${cliente.telefono}'),
            Text('Correo: ${cliente.correo}'),
            Text('ID Mascota: ${cliente.idMascota}'),
          ],
        ),
      ),
    );
  }
}
