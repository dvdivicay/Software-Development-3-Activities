import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 9',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  String _result = '';

  @override
  void dispose() {
    _aController.dispose();
    _bController.dispose();
    super.dispose();
  }

  double? _parseInput(String s) {
    if (s.trim().isEmpty) return null;
    return double.tryParse(s);
  }

  void _calculate(String op) {
    final a = _parseInput(_aController.text);
    final b = _parseInput(_bController.text);

    if (a == null || b == null) {
      setState(() {
        _result = 'Please enter valid numbers';
      });
      return;
    }

    double res;
    switch (op) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '×':
      case '*':
        res = a * b;
        break;
      case '÷':
      case '/':
        if (b == 0) {
          setState(() {
            _result = 'Division by zero';
          });
          return;
        }
        res = a / b;
        break;
      default:
        res = 0;
    }

    setState(() {
      _result = res.toString();
    });
  }

  Widget _buildNumberField({
    required String label,
    required TextEditingController controller,
  }) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle calcButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 9'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                _buildNumberField(label: 'A', controller: _aController),
                const SizedBox(width: 12),
                _buildNumberField(label: 'B', controller: _bController),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  style: calcButtonStyle,
                  child: const Text('Add (+)'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  style: calcButtonStyle,
                  child: const Text('Subtract (-)'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('×'),
                  style: calcButtonStyle,
                  child: const Text('Multiply (×)'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('÷'),
                  style: calcButtonStyle,
                  child: const Text('Divide (÷)'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Result: $_result',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}