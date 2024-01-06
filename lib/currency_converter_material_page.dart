import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) / 81;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade600,
        title: const Text("Currency Converter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConvertedCurrencyResult(result: result),
            const SizedBox(height: 20),
            CurrencyTextField(textEditingController: textEditingController),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: convert,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  minimumSize:
                      MaterialStatePropertyAll(Size(double.infinity, 50)),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConvertedCurrencyResult extends StatelessWidget {
  const ConvertedCurrencyResult({
    super.key,
    required this.result,
  });

  final double result;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${result.toStringAsFixed(2)}",
      style: const TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class CurrencyTextField extends StatelessWidget {
  const CurrencyTextField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textEditingController,
        style: const TextStyle(color: Colors.black),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: '  Enter the amount to convert!',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.currency_rupee),
          prefixIconColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(45),
          ),
        ),
      ),
    );
  }
}
