import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String _infoText = "Informe seus dados";
  Color _resultColor = Colors.blueGrey;

  void _resetFields() {
    _weightController.clear();
    _heightController.clear();
    setState(() {
      _infoText = "Informe seus dados";
      _resultColor = Colors.blueGrey;
    });
  }

  void _calculate() {
    double? weight = double.tryParse(_weightController.text.replaceFirst(',', '.'));
    double? height = double.tryParse(_heightController.text.replaceFirst(',', '.'));

    if (weight == null || height == null || height <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, insira valores válidos!")),
      );
      return;
    }

    double imc = weight / (height * height);

    setState(() {
      if (imc < 18.5) {
        _infoText = "Abaixo do peso (${imc.toStringAsFixed(2)})";
        _resultColor = Colors.orange;
      } else if (imc < 25.0) {
        _infoText = "Peso ideal (${imc.toStringAsFixed(2)})";
        _resultColor = Colors.green;
      } else if (imc < 30.0) {
        _infoText = "Sobrepeso (${imc.toStringAsFixed(2)})";
        _resultColor = Colors.deepOrange;
      } else if (imc < 35.0) {
        _infoText = "Obesidade Grau I (${imc.toStringAsFixed(2)})";
        _resultColor = Colors.redAccent;
      } else if (imc < 40.0) {
        _infoText = "Obesidade Grau II (${imc.toStringAsFixed(2)})";
        _resultColor = Colors.red;
      } else {
        _infoText = "Obesidade Grau III (${imc.toStringAsFixed(2)})";
        _resultColor = Colors.purple;
      }

      _weightController.clear();
      _heightController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cálculo realizado com sucesso!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcule IMC"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SizedBox(
                width: 250, 
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Peso (kg)",
                    hintText: "Ex: 70.5",
                  ),
                  textAlign: TextAlign.center,
                  controller: _weightController,
                ),
              ),
            ),
            
            const SizedBox(height: 10), 

            Center(
              child: SizedBox(
                width: 250, 
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Altura (m)",
                    hintText: "Ex: 1.75",
                  ),
                  textAlign: TextAlign.center,
                  controller: _heightController,
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Center( 
                child: SizedBox(
                  width: 150, 
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      _calculate();
                      FocusScope.of(context).unfocus();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _resultColor,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
