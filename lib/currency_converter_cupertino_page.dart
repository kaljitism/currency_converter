import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) / 81;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeGreen,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeGreen.darkHighContrastColor,
        middle: const Text("Currency Converter"),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConvertedCurrencyResult(result: result),
            const SizedBox(height: 20),
            CurrencyTextField(textEditingController: textEditingController),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                child: const Text(
                  'Convert',
                  style: TextStyle(color: CupertinoColors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
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
      child: CupertinoTextField(
        controller: textEditingController,
        style: const TextStyle(color: CupertinoColors.black),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        placeholder: '  Enter the amount to convert!',
        placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
        prefix: const Text(
          '\u{20B9}',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(45),
          color: CupertinoColors.white,
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
        color: CupertinoColors.white,
      ),
    );
  }
}
