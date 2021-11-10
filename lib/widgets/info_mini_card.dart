// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoMiniCard extends StatelessWidget {
  final String titulo;
  final String info;
  final Icon icon;
  InfoMiniCard(this.titulo, this.info, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Colors.black26, width: 0.4))),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                titulo,
                style: TextStyle(color: Colors.black54),
              ),
              trailing: icon,
            ),
            Center(
              child: Text(
                info,
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ));
  }
}
