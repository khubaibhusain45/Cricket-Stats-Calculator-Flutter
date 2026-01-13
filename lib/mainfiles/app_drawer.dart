import 'package:flutter/material.dart';
import '../calculations//batsman_average.dart';
import '../calculations/batsman_strikerate.dart';
import '../calculations//bowler_avg.dart';
import '../calculations//bowler_economy.dart';
import '../calculations//bowler_sr.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Image.asset(
              'assets/images/a.png',
              fit: BoxFit.fitHeight, // Makes the image cover the area
            ),
          ),

          // Drawer Items
          _drawerItem(
            context,
            url: 'assets/images/avg.png',
            title: "Batsman Average",
            subtitle: "Calculate Average of Batsman",
            screen: BatsmanAverageWidget(),
          ),
          _drawerItem(
            context,
            url: 'assets/images/sr.png',
            title: "Batsman Strike Rate",
            subtitle: "Calculate Strike Rate of Batsman",
            screen: BatsmanStrikeRateWidget(),
          ),
          _drawerItem(
            context,
            url: 'assets/images/avg.png',
            title: "Bowler Average",
            subtitle: "Calculate Average of Bowler",
            screen: BowlerAverageWidget(),
          ),
          _drawerItem(
            context,
            url: 'assets/images/sr.png',
            title: "Bowler Strike Rate",
            subtitle: "Calculate Strike Rate of Bowler",
            screen: BowlerStrikeRateWidget(),
          ),
          _drawerItem(
            context,
            url: 'assets/images/ec.jpg',
            title: "Bowler Economy",
            subtitle: "Calculate Economy of Bowler",
            screen: BowlerEconomyWidget(),
          ),
        
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required String url,
    required String title,
    required String subtitle,
    Widget? screen,
  }) {
    return ListTile(
      leading: CircleAvatar(radius: 20, backgroundImage: AssetImage(url)),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      subtitle: Text(subtitle),
      tileColor: Colors.white,
      onTap: () {
        Navigator.pop(context); // Close drawer first
        if (screen != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
    );
  }
}
