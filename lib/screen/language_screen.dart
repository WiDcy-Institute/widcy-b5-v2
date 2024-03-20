
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widcy2/util/LanguageProvider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  @override
  Widget build(BuildContext context) {

    var languageProvider = Provider.of<LanguageProvider>(context);
    final locale = languageProvider.local;

    return Scaffold(
      body: ListView(
        children: [
          Card(
            elevation: 0.5,
            child: ListTile(
              leading: Icon(Icons.language),
              trailing: Checkbox(
                value: true,
                onChanged: (bool? value) {

                },
              ),
              title: Text("English"),
            ),
          ),
          Card(
            elevation: 0.5,
            child: ListTile(
              leading: Icon(Icons.language),
              trailing: Checkbox(
                value: false,
                onChanged: (bool? value) {

                },
              ),
              title: Text("Khmer"),
            ),
          )
        ],
      ),
    );
  }
}
