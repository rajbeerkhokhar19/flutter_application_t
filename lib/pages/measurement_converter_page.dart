import 'package:flutter/material.dart';

class MeasurementConverterPage extends StatefulWidget {
  @override
  _MeasurementConverterPageState createState() => _MeasurementConverterPageState();
}

class _MeasurementConverterPageState extends State<MeasurementConverterPage> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0;
  String _currentSelectedUnit = 'Kilometers to Miles';

  final Map<String, double> _conversionRates = {
    'Kilometers to Miles': 0.621371,
    'Kilograms to Pounds': 2.20462,
    'Celsius to Fahrenheit': 33.8,  // Conversion logic needs adjusting for non-linear conversions
  };

  void _convert() {
    double input = double.tryParse(_controller.text) ?? 0;
    setState(() {
      _result = input * (_conversionRates[_currentSelectedUnit] ?? 1);
      if (_currentSelectedUnit == 'Celsius to Fahrenheit') {
        _result = (input * 1.8) + 32; // Correct conversion for Celsius to Fahrenheit
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measurement Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter value',
                suffixText: _currentSelectedUnit.split(' to ')[0],
              ),
            ),
            DropdownButton<String>(
              value: _currentSelectedUnit,
              onChanged: (value) {
                setState(() {
                  _currentSelectedUnit = value!;
                });
              },
              items: _conversionRates.keys.map<DropdownMenuItem<String>>((String key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Text(key),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text('Result: $_result ${_currentSelectedUnit.split(' to ')[1]}'),
          ],
        ),
      ),
    );
  }
}
