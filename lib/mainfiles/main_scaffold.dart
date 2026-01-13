import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'exitapp.dart';

class MainScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const MainScaffold({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showExitDialog(context); // exit confirmation
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title,style: TextStyle(fontSize: 18),),
          backgroundColor: Colors.grey,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        drawer: const AppDrawer(), // Global drawer
        body: body,
      ),
    );
  }
}
