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
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 12),
      child: Row(
        children: [
          //Icon(icon, color: Colors.amber.shade100, size: 30),
          IconButton(
            icon: Icon(icon, color: Colors.amber.shade100, size: 30),
            onPressed: () => {canLaunch(url)},
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 26, color: Colors.white
            ),
          )
        ],
      ),
    );
  }

  //_launchURL(String url) => launch(url);
}
