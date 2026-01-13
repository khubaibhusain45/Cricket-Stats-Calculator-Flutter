import 'package:flutter/material.dart';
import 'package:stats_calculator/mainfiles/main_scaffold.dart';

class BatsmanStrikeRateWidget extends StatelessWidget {
  const BatsmanStrikeRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Runs = TextEditingController();
    final Balls = TextEditingController();

    return MainScaffold(
      title: "Strike Rate Calculator",
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
                    controller: Runs,
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
                    controller: Balls,
                    decoration: InputDecoration(
                      hintText: "Balls Played",
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
                    if (Runs.text.isEmpty || Balls.text.isEmpty) {
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

                    double runs = double.parse(Runs.text);
                    double balls = double.parse(Balls.text);

                    if (balls == 0) return;

                    double strikerate = (runs / balls) * 100;

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Strike Rate"),
                        content: Text(
                          "Your Strike Rate is ${strikerate.toStringAsFixed(2)}",
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
                  child: Text("Calculate Strike Rate"),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // Clear the TextFields
                    Runs.clear();
                    Balls.clear();

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
