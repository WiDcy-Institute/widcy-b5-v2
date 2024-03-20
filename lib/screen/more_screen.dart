
import 'package:flutter/material.dart';
import 'package:widcy2/screen/language_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GestureDetector(
            child: Card(
              elevation: 1,
              child: ListTile(
                leading: Icon(Icons.language),
                title: Text("Lanauage"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            onTap: (){
              final route = MaterialPageRoute(builder: (context) => LanguageScreen());
              Navigator.of(context).push(route);
            },
          )
        ],
      ),
    );
  }
}
