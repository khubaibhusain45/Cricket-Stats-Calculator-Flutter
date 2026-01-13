import 'package:flutter/material.dart';
import 'package:stats_calculator/mainfiles/main_scaffold.dart';

class BowlerStrikeRateWidget extends StatelessWidget {
  const BowlerStrikeRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BallsBowled = TextEditingController();
    final Wkts = TextEditingController();

    return MainScaffold(
      title: "Bowler SR Calculator",
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
                    controller: BallsBowled,
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
                    controller: Wkts,
                    decoration: InputDecoration(
                      hintText: "Wickets Taken",
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
                    if (BallsBowled.text.isEmpty || Wkts.text.isEmpty) {
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

                    double BallsBowl = double.parse(BallsBowled.text);
                    double Wkt = double.parse(Wkts.text);

                    double overs = BallsBowl * 6;

                    if (BallsBowl == 0) return;

                    double strikerate = (overs / Wkt);

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
                    BallsBowled.clear();
                    Wkts.clear();

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
