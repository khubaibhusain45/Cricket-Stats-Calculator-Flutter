import 'package:flutter/material.dart';
import 'package:stats_calculator/mainfiles/main_scaffold.dart';

class BowlerEconomyWidget extends StatelessWidget {
  const BowlerEconomyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Runs = TextEditingController();
    final Overs = TextEditingController();

    return MainScaffold(
      title: "Bowler Economy Calculator",
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
              Image.asset('assets/images/bl.png'),
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
                      hintText: "Runs Conceded",
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
                    controller: Overs,
                    decoration: InputDecoration(
                      hintText: "Overs Bowled",
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
                    if (Runs.text.isEmpty || Overs.text.isEmpty) {
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

                    double run = double.parse(Runs.text);
                    double over = double.parse(Overs.text);

                    if (over == 0) return;

                    double economy = (run / over);

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Economy Rate"),
                        content: Text(
                          "Your Economy Rate is ${economy.toStringAsFixed(2)}",
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
                  child: Text("Calculate Economy"),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // Clear the TextFields
                    Runs.clear();
                    Overs.clear();

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
