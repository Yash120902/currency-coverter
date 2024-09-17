import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0.0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() { setState(() {
  result = double.parse(textEditingController.text) * 80;
  });}

  @override
  void initState() {
    super.initState();
    // Adding a listener to handle changes in the text field
    textEditingController.addListener(() {
      setState(() {
        if (textEditingController.text.isEmpty) {
          result = 0.0;
        }
      });
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed from the widget tree
    textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xff132d46),
        width: 2.0,
      ),

      borderRadius: BorderRadius.circular(10.0),

    );
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: const Text('Currency Converter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff),

                ),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color(0xff191e29),
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in usd',
                  hintStyle: const TextStyle(
                    color: Color(0xff696679),
                  ),
                  prefixIcon: const Icon(
                      Icons.monetization_on_outlined,
                      color: Color(0xff696679)
                  ),
                  filled: true,
                  fillColor: const Color(0xffffffff),
                  focusedBorder: borderStyle,
                  enabledBorder: borderStyle,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: convert,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff191e29),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),

                  ),
                  child: const Text('Convert')
              ),
            ],
          ),
        ),
      ),

    );
  }
}