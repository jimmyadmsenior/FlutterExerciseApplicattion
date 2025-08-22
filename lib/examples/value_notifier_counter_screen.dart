import 'package:flutter/material.dart';

class CounterScreenValueNotifier extends StatefulWidget {
  const CounterScreenValueNotifier({super.key});

  @override
  State<CounterScreenValueNotifier> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreenValueNotifier> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<String> _message =
      ValueNotifier<String>('Toque nos botões para alterar o contador ');
  final ValueNotifier<Color> _counterColor = ValueNotifier<Color>(Colors.blue);

  void _incrementCounter() {
    _counter.value++;
    _updateMessage();
    _updateCounterColor();
  }

  void _decrementCounter() {
    _counter.value--;
    _updateMessage();
    _updateCounterColor();
  }

  void _resetCounter() {
    _counter.value = 0;
    _message.value = 'Contador resetado';
    _counterColor.value = Colors.blue;
  }

  void _updateMessage() {
    if (_counter.value == 0) {
      _message.value = 'Contador zerado';
    } else if (_counter.value > 0) {
      _message.value = 'Contador positivo ${_counter.value}';
    } else {
      _message.value = 'Contador negativo ${_counter.value}';
    }
  }

  void _updateCounterColor() {
    if (_counter.value > 0) {
      _counterColor.value = Colors.green;
    } else if (_counter.value < 0) {
      _counterColor.value = Colors.red;
    } else {
      _counterColor.value = Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Interativo'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<Color>(
                valueListenable: _counterColor,
                builder: (context, color, _) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Valor do contador:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ValueListenableBuilder<int>(
                          valueListenable: _counter,
                          builder: (context, value, _) {
                            return Text(
                              '$value',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<String>(
                valueListenable: _message,
                builder: (context, value, _) {
                  return Text(
                    value,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _resetCounter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    _message.dispose();
    _counterColor.dispose();
    super.dispose();
  }
}
