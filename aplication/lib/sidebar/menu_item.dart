import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String url;

  const MenuItem({Key key, this.icon, this.title, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: Padding(
        padding: EdgeInsets.all(size.height*0.025),
        child: Row(
          children: [
            Icon(icon, color: Colors.amber.shade100, size: size.height*0.048),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: size.height*0.038, color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }

  //_launchURL(String url) => launch(url);
}
