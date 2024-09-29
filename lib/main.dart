import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Конвертор Одиниць',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Converter(),
    );
  }
}

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _milesController = TextEditingController();
  final TextEditingController _gallonsController = TextEditingController();
  final TextEditingController _litersController = TextEditingController();
  final TextEditingController _bytesController = TextEditingController();
  final TextEditingController _kilobytesController = TextEditingController();

  String _kmToMilesResult = '';
  String _milesToKmResult = '';
  String _gallonsToLitersResult = '';
  String _litersToGallonsResult = '';
  String _bytesToKilobytesResult = '';
  String _kilobytesToBytesResult = '';

  void _convertToMiles() {
    final String kmText = _kmController.text;
    if (kmText.isNotEmpty && double.tryParse(kmText) != null) {
      final double km = double.parse(kmText);
      setState(() {
        _kmToMilesResult = '${(km * 0.621371).toStringAsFixed(2)} миль';
      });
    } else {
      setState(() {
        _kmToMilesResult = 'Будь ласка, введіть дійсне число для кілометрів';
      });
    }
  }

  void _convertToKilometers() {
    final String milesText = _milesController.text;
    if (milesText.isNotEmpty && double.tryParse(milesText) != null) {
      final double miles = double.parse(milesText);
      setState(() {
        _milesToKmResult = '${(miles / 0.621371).toStringAsFixed(2)} км';
      });
    } else {
      setState(() {
        _milesToKmResult = 'Будь ласка, введіть дійсне число для миль';
      });
    }
  }

  void _convertToLiters() {
    final String gallonsText = _gallonsController.text;
    if (gallonsText.isNotEmpty && double.tryParse(gallonsText) != null) {
      final double gallons = double.parse(gallonsText);
      setState(() {
        _gallonsToLitersResult = '${(gallons * 3.78541).toStringAsFixed(2)} літрів';
      });
    } else {
      setState(() {
        _gallonsToLitersResult = 'Будь ласка, введіть дійсне число для галонів';
      });
    }
  }

  void _convertToGallons() {
    final String litersText = _litersController.text;
    if (litersText.isNotEmpty && double.tryParse(litersText) != null) {
      final double liters = double.parse(litersText);
      setState(() {
        _litersToGallonsResult = '${(liters / 3.78541).toStringAsFixed(2)} галонів';
      });
    } else {
      setState(() {
        _litersToGallonsResult = 'Будь ласка, введіть дійсне число для літрів';
      });
    }
  }

  void _convertToKilobytes() {
    final String bytesText = _bytesController.text;
    if (bytesText.isNotEmpty && double.tryParse(bytesText) != null) {
      final double bytes = double.parse(bytesText);
      setState(() {
        _bytesToKilobytesResult = '${(bytes / 1024).toStringAsFixed(2)} кілобайт';
      });
    } else {
      setState(() {
        _bytesToKilobytesResult = 'Будь ласка, введіть дійсне число для байтів';
      });
    }
  }

  void _convertToBytes() {
    final String kilobytesText = _kilobytesController.text;
    if (kilobytesText.isNotEmpty && double.tryParse(kilobytesText) != null) {
      final double kilobytes = double.parse(kilobytesText);
      setState(() {
        _kilobytesToBytesResult = '${(kilobytes * 1024).toStringAsFixed(2)} байтів';
      });
    } else {
      setState(() {
        _kilobytesToBytesResult = 'Будь ласка, введіть дійсне число для кілобайт';
      });
    }
  }

  void _clearFields() {
    _kmController.clear();
    _milesController.clear();
    _gallonsController.clear();
    _litersController.clear();
    _bytesController.clear();
    _kilobytesController.clear();
    setState(() {
      _kmToMilesResult = '';
      _milesToKmResult = '';
      _gallonsToLitersResult = '';
      _litersToGallonsResult = '';
      _bytesToKilobytesResult = '';
      _kilobytesToBytesResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Конвертор Одиниць'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTextField(
                controller: _kmController,
                label: 'Кілометри',
                onChanged: (value) {
                  setState(() {
                    _kmToMilesResult = '';
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                _kmToMilesResult,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertToMiles,
                child: const Text('Конвертувати в Мілі'),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _milesController,
                label: 'Мілі',
                onChanged: (value) {
                  setState(() {
                    _milesToKmResult = '';
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                _milesToKmResult,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertToKilometers,
                child: const Text('Конвертувати в Кілометри'),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _gallonsController,
                label: 'Галони',
                onChanged: (value) {
                  setState(() {
                    _gallonsToLitersResult = '';
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                _gallonsToLitersResult,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertToLiters,
                child: const Text('Конвертувати в Літри'),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _litersController,
                label: 'Літри',
                onChanged: (value) {
                  setState(() {
                    _litersToGallonsResult = '';
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                _litersToGallonsResult,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertToGallons,
                child: const Text('Конвертувати в Галони'),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _bytesController,
                label: 'Байти',
                onChanged: (value) {
                  setState(() {
                    _bytesToKilobytesResult = '';
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                _bytesToKilobytesResult,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertToKilobytes,
                child: const Text('Конвертувати в Кілобайти'),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _kilobytesController,
                label: 'Кілобайти',
                onChanged: (value) {
                  setState(() {
                    _kilobytesToBytesResult = '';
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                _kilobytesToBytesResult,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertToBytes,
                child: const Text('Конвертувати в Байти'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _clearFields,
                child: const Text('Очистити'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}