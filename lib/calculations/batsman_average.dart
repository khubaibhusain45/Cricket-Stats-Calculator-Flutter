import 'package:flutter/material.dart';
import 'package:stats_calculator/mainfiles/main_scaffold.dart';

class BatsmanAverageWidget extends StatelessWidget {
  const BatsmanAverageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inningsController = TextEditingController();
    final outsController = TextEditingController();
    late double inn;
    late double out;

    return MainScaffold(
      title: "Average Calculator",
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // dismiss keyboard
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Enter details below",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/images/b.png'),
              SizedBox(height: 20),

              // Runs TextField
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: inningsController,
                    decoration: InputDecoration(
                      hintText: "Runs",
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),

              // Outs TextField
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: outsController,
                    decoration: InputDecoration(
                      hintText: "Dismissals",
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),

              // Calculate Button
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    if (inningsController.text.isEmpty ||
                        outsController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Alert"),
                          content: Text("Values can't be empty"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("Enter Values"),
                            ),
                          ],
                        ),
                      );
                      return;
                    }

                    inn = double.parse(inningsController.text);
                    out = double.parse(outsController.text);

                    if (out == 0) return;

                    double average = inn / out;

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Average"),
                        content: Text(
                          "Your Average is ${average.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 20),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple,
                    shadowColor: Colors.purple,
                    elevation: 8,
                  ),
                  child: Text("Calculate Average"),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // Clear the TextFields
                    inningsController.clear();
                    outsController.clear();

                    // Optionally, dismiss the keyboard
                    FocusScope.of(context).unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    shadowColor: Colors.red,
                    elevation: 8,
                  ),
                  child: Text("Clear All"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
