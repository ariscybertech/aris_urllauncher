import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final String lat = "37.3230";
  final String lng = "-122.0312";

  final String telephoneNumber = "01817658822";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Launcher"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("Launch Web Page"),
            onTap: () async {
              const url = 'https://google.com';

              if (await canLaunch(url)) {
                await launch(url, forceWebView: true);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            title: Text("Launch Maps"),
            onTap: () async {
              final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
              final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

              if (await canLaunch(googleMapsUrl)) {
                await launch(googleMapsUrl);
              }
              if (await canLaunch(appleMapsUrl)) {
                await launch(appleMapsUrl, forceSafariVC: false);
              } else {
                throw "Couldn't launch URL";
              }
            },
          ),
          ListTile(
            title: Text("Telephone"),
            onTap: () async {
              String telephoneUrl = "tel:$telephoneNumber";

              if (await canLaunch(telephoneUrl)) {
                await launch(telephoneUrl);
              } else {
                throw "Can't phone that number.";
              }
            },
          ),
        ],
      ),
    );
  }
}
