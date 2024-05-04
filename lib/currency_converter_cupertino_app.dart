import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  
  double result = 0;
    TextEditingController textEditingController = TextEditingController();

    void convert() {
      result = double.parse(textEditingController.text) * 80;
      setState(() {});
    }

    @override
  void initState() {
     super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      home: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey3,
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: Color.fromARGB(255, 52, 187, 232),
          middle: Text(
            "Currency Converter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CupertinoColors.systemGrey3,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  // margin: const EdgeInsets.all(10),
                  // color: Colors.blue,
                  child: Text(
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    // textFiled to be printed on display
                    'INR : ${result!=0?result.toStringAsFixed(3):result.toStringAsFixed(0)}',
                  ),
                ),
                CupertinoTextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: CupertinoColors.black,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  placeholder: 'Please enter the amount in USD',
                  prefix: const Icon(CupertinoIcons.money_dollar),
                  keyboardType : const TextInputType.numberWithOptions(
                    decimal: true,
                  )
                ),
                const SizedBox(height: 10),
                CupertinoButton(
                  onPressed: convert,
                  color: CupertinoColors.black,
                  child: const Text("Convert"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}