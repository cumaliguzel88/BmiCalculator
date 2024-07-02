import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  TextEditingController _controllerHeight = TextEditingController();
  TextEditingController _controllerWeight = TextEditingController();
  double _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/bmi.png",
            height: 220,
            width: 430,
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _controllerHeight,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Height:",
                  suffixText: "cm",
                  prefixIcon: Icon(Icons.height_sharp)),
            ),
          ),
          SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _controllerWeight,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Weight:",
                  prefixIcon: Icon(Icons.monitor_weight),
                  suffixText: "kg"),
            ),
          ),
          SizedBox(height: 20),
          Text(_result.toStringAsFixed(2), style: TextStyle(fontSize: 35)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _bmiCalculate();
            },
            child: Text(
              "Calculate",
              style: (TextStyle(color: Colors.white, fontSize: 25)),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[400]),
          )
        ],
      ),
    );
  }

  void _bmiCalculate() {
    double _height = double.parse(_controllerHeight.text);
    double _weight = double.parse(_controllerWeight.text);
    setState(() {
      _result = _weight / (_height * _height);
    });
  }
}
