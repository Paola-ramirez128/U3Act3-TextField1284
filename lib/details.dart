import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({
    Key? key, 
    required this.idSucursal,
    required this.nombre,
    required this.direccion,
    required this.ciudad,
    required this.encargado,
    required this.horario,
    required this.telefono,
  }) : super(key: key);

  final String idSucursal;
  final String nombre;
  final String direccion;
  final String ciudad;
  final String encargado;
  final String horario;
  final String telefono;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 153, 153),
        centerTitle: true,
        title: const Text("Detalles de Sucursal"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de información principal
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.store, color: Color.fromARGB(255, 206, 113, 118)),
                      title: Text(
                        nombre,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text("ID: $idSucursal"),
                    ),
                    const Divider(),
                    _buildInfoRow(Icons.person, "Encargado:", encargado),
                    _buildInfoRow(Icons.phone, "Teléfono:", telefono),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Sección de ubicación
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const SizedBox(height: 8),
                    _buildInfoRow(Icons.location_on, "Dirección:", direccion),
                    _buildInfoRow(Icons.location_city, "Ciudad:", ciudad),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Sección de horario
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const SizedBox(height: 8),
                    _buildInfoRow(Icons.access_time, "Horario de atención:", horario),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Botón de acción
            
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para construir filas de información
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}