import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    title: "Elton Jefferson",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Nunito',
      backgroundColor: Colors.cyan[600],
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70.0, bottom: 10.0),
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: circleImage(
                width: 320.0,
                height: 320.0,
                img: 'images/myprofile.png',
              ),
            ),
            textCustom('Elton Correia', 40.0, FontWeight.bold),
            textCustom(
              'Python Developer/Learning Flutter',
              20.0,
              FontWeight.normal,
            ),
            Container(
              width: 300.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  networksIcons(
                    'images/github.png',
                    'https://github.com/eltonjncorreia',
                  ),
                  networksIcons(
                    'images/linkedin.png',
                    'https://www.linkedin.com/in/elton-jefferson/',
                  ),
                  networksIcons(
                    'images/twitter.png',
                    'https://twitter.com/eltonjncorreia',
                  ),
                  networksIcons(
                    'images/facebook.png',
                    'https://www.facebook.com/elton.ej/',
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 108.0),
              child: GestureDetector(
                onTap: () async => _launchURL(
                  'https://github.com/eltonjncorreia/eltonjncorreia.github.io',
                ),
                child: Text(
                  'Developed with Flutter!',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.amber,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textCustom(String text, double size, [FontWeight font]) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: font,
          fontSize: size,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget circleImage({double width, double height, String img}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(img),
        ),
      ),
    );
  }

  Widget networksIcons(String img, String url) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        child: circleImage(img: img, width: 40.0, height: 40.0),
        onTap: () async => _launchURL(url),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
