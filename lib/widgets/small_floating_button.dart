import 'package:flutter/material.dart';

import '../helpers/commons.dart';

class SmallButton extends StatelessWidget {
  final IconData icon;

  SmallButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.favorite, 
          color: red,)
      ),
    );
  }
}