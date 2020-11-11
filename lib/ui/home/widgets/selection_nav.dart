import 'package:flutter/material.dart';
import 'package:flutter_kyc/style/color.dart';

class SelectionNavSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            title: Text("Dashboard"),
            leading: Icon(Icons.dashboard),
          ),
          ListTile(
            title: Text("Profile"),
            leading: Icon(Icons.person_pin),
            selected: true,
          )
        ],
      ),
    );
  }
}
