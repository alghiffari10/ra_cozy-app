import 'package:flutter/material.dart';
import 'package:ra_cozy/poges/home_page.dart';
import 'package:ra_cozy/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/splash_image.png")),
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png")),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Find Cozy House\nto Stay and Happy",
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 210,
                  height: 50,

                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                    color: purpleColor,
                    child: Text(
                      "Explore Now",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}