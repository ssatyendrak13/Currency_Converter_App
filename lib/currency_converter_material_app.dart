import "package:flutter/material.dart";

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppMaterialPageState();
}

class _MyAppMaterialPageState extends State<MyApp> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 80;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Colors.green,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 52, 187, 232),
          title: const Text(
            "Currency Converter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
                TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: border,
                    enabledBorder: border,
                    prefixIconColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.monetization_on,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 62, 67, 69),
                    hintText: "Please Enter the Amount In USD",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: convert,
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
