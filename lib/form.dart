import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Controladores para los campos del formulario
  final _idSucursalController = TextEditingController();
  final _nombreController = TextEditingController();
  final _direccionController = TextEditingController();
  final _ciudadController = TextEditingController();
  final _encargadoController = TextEditingController();
  final _horarioController = TextEditingController();
  final _telefonoController = TextEditingController();

  @override
  void dispose() {
    // Limpiar todos los controladores
    _idSucursalController.dispose();
    _nombreController.dispose();
    _direccionController.dispose();
    _ciudadController.dispose();
    _encargadoController.dispose();
    _horarioController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 153, 153),
        title: const Text("Formulario de Sucursal"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            
           
            MyTextField(
              myController: _idSucursalController,
              fieldName: "ID Sucursal",
              myIcon: Icons.account_balance,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _nombreController,
              fieldName: "Nombre de la Sucursal",
              myIcon: Icons.store,
            ),
            
            // Sección de ubicación
           
            MyTextField(
              myController: _direccionController,
              fieldName: "Dirección",
              myIcon: Icons.location_on,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _ciudadController,
              fieldName: "Ciudad",
              myIcon: Icons.location_city,
            ),
            
            // Sección de contacto
           
            MyTextField(
              myController: _encargadoController,
              fieldName: "Encargado",
              myIcon: Icons.person,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _telefonoController,
              fieldName: "Teléfono",
              myIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _horarioController,
              fieldName: "Horario",
              myIcon: Icons.access_time,
            ),
            
            const SizedBox(height: 30.0),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

 

  ElevatedButton _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color.fromARGB(255, 241, 153, 153),
        foregroundColor: Colors.black,
      ),
      onPressed: () {
        if (_validateFields()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(
                idSucursal: _idSucursalController.text,
                nombre: _nombreController.text,
                direccion: _direccionController.text,
                ciudad: _ciudadController.text,
                encargado: _encargadoController.text,
                horario: _horarioController.text,
                telefono: _telefonoController.text,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Por favor complete todos los campos'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: const Text(
        "GUARDAR SUCURSAL",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  bool _validateFields() {
    return _idSucursalController.text.isNotEmpty &&
        _nombreController.text.isNotEmpty &&
        _direccionController.text.isNotEmpty &&
        _ciudadController.text.isNotEmpty &&
        _encargadoController.text.isNotEmpty &&
        _horarioController.text.isNotEmpty &&
        _telefonoController.text.isNotEmpty;
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = const Color.fromARGB(255, 218, 134, 134),
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromARGB(255, 73, 67, 83)),
        ),
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}