import 'package:flutter/material.dart';

class NotaFinalPage extends StatefulWidget {
  const NotaFinalPage({super.key});

  @override
  State<NotaFinalPage> createState() => _NotaFinalPageState();
}

class _NotaFinalPageState extends State<NotaFinalPage> {

  //Variables

  final _score1 = TextEditingController();
  final _score2 = TextEditingController();
  final _score3 = TextEditingController();
  final _score4 = TextEditingController();

  final _percentage1 = TextEditingController();
  final _percentage2 = TextEditingController();
  final _percentage3 = TextEditingController();
  final _percentage4 = TextEditingController();

  double _product = 0;
  double _percentages = 0.0;

  bool _verificationPer = true;

  //Funciones

  void _finalGradeCalculator() {
    _dataVerification();
    _percentagesVerification();
    _rangeVerification();
    if (_verificationPer == true){
      setState(() {
        try {
          _product = (((double.parse(_score1.text) * double.parse(_percentage1.text)) +
              (double.parse(_score2.text) * double.parse(_percentage2.text)) +
              (double.parse(_score3.text) * double.parse(_percentage3.text)) +
              (double.parse(_score4.text) * double.parse(_percentage4.text))))/100;
        } catch (e) {
          print('Error: $e. Por favor ingrese valores validos');
        }
      }
      );
    }
  }

  void _dataVerification(){
    if (_score1.text.isEmpty) {
      _score1.text = '0';  // Asigna el valor por defecto si el campo está vacío
    }
    if (_score2.text.isEmpty) {
      _score2.text = '0';  // Asigna el valor por defecto si el campo está vacío
    }
    if (_score3.text.isEmpty) {
      _score3.text = '0';  // Asigna el valor por defecto si el campo está vacío
    }
    if (_score4.text.isEmpty) {
      _score4.text = '0';  // Asigna el valor por defecto si el campo está vacío
    }
    if (_percentage1.text.isEmpty) {
      _percentage1.text = '0';  // Asigna el valor por defecto si el campo está vacío
    }
    if (_percentage2.text.isEmpty) {
      _percentage2.text = '0';  // Asigna el valor por defecto si el campo está vacío
    }
    if (_percentage3.text.isEmpty) {
      _percentage3.text = '0';  // Asigna el valor por defecto si el campo está vacío
    }
    if (_percentage4.text.isEmpty) {
      _percentage4.text = '0';  // Asigna el valor por defecto si el campo está vacío
    }
  }

  void _percentagesVerification(){
    _percentages = double.parse(_percentage1.text) + double.parse(_percentage2.text) +double.parse(_percentage3.text) + double.parse(_percentage4.text);

    if (_percentages>100){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("La suma de los porcentajes no puede superar el 100%"),
          backgroundColor: Colors.red,
        ),
      );
      _verificationPer = false;
    }
    else if(double.parse(_percentage1.text) < 0 || double.parse(_percentage2.text) < 0 || double.parse(_percentage3.text) < 0 ||double.parse(_percentage4.text) < 0){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingrese valores válidos para los porcentajes."),
          backgroundColor: Colors.red,
        ),
      );
      _verificationPer = false;
    }
    else{ _verificationPer = true; }
  }

  void _rangeVerification(){
    if (double.parse(_score1.text) > 5.0 || double.parse(_score2.text) > 5.0 || double.parse(_score3.text) > 5.0 ||double.parse(_score4.text) > 5.0){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Las notas deben tener un valor entre 0 y 5"),
          backgroundColor: Colors.red,
        ),
      );
      _verificationPer = false;
    }
    else if (double.parse(_score1.text) < 0 || double.parse(_score2.text) < 0 || double.parse(_score3.text) < 0 ||double.parse(_score4.text) < 0){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Las notas deben tener un valor entre 0 y 5"),
          backgroundColor: Colors.red,
        ),
      );
      _verificationPer = false;
    }
    else{ _verificationPer = true; }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Text("Calcula tu definitiva",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
            Spacer(),
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 50,
              height: 50,
            ),
          ],
        ),
      backgroundColor: Colors.grey[300],
      ),

      body: Container(
        padding: EdgeInsets.all(16.0), // Padding dentro del container
        margin: EdgeInsets.all(8.0), // Margin fuera del container
        decoration: BoxDecoration(
          color: Colors.teal[50], // Color de fondo
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child:
                      Text("Calificaciones y porcentajes",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/images/lapiz.png'),
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
            
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _score1,
            
                        decoration: InputDecoration(
                          labelText: "Nota 1 (0 to 5)",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 16,),
                    Expanded(
                      child: TextFormField(
                      controller: _percentage1,
                      decoration: InputDecoration(
                        labelText: "Porcentaje 1",
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                        keyboardType: TextInputType.number,
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _score2,
                        decoration: InputDecoration(
                          labelText: "Nota 2 (0 to 5)",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _percentage2,
                        decoration: InputDecoration(
                          labelText: "Porcentaje 2",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _score3,
                        decoration: InputDecoration(
                          labelText: "Nota 3 (0 to 5)",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _percentage3,
                        decoration: InputDecoration(
                          labelText: "Porcentaje 3",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _score4,
                        decoration: InputDecoration(
                          labelText: "Nota 4 (0 to 5)",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _percentage4,
                        decoration: InputDecoration(
                          labelText: "Porcentaje 4",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  icon: const Icon(Icons.add_chart_rounded),
                    onPressed:(){
                      _finalGradeCalculator();
                    },
                  label: const Text("Calcular"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Su nota final es: ${_product}'),
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}
