import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double amount = 0;
  final TextEditingController amountController = TextEditingController();

  void convert() {
    setState(() {
      amount = double.parse(amountController.text) * 130;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        // elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.0,
            // cannot use crossAxisAlignment as Column takes only space required for its children so we need to use center for horizontal alignment
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Rs ${amount != 0 ? amount.toStringAsFixed(2) : amount.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              TextField(
                controller: amountController,
                style: TextStyle(
                  color: Colors.black,
                  // decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                  hintText: "Please enter the amount in USD",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 5.0),
              //Button
              // 2 types of button (RaisedButton and TextButton)
              TextButton(
                onPressed: convert,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text("Convert"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
