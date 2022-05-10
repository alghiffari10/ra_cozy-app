import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ra_cozy/models/city.dart';
import 'package:ra_cozy/models/space.dart';
import 'package:ra_cozy/models/tips.dart';
import 'package:ra_cozy/providers/space_provider.dart';
import 'package:ra_cozy/theme.dart';
import 'package:ra_cozy/widget/bottom_navbar_item.dart';
import 'package:ra_cozy/widget/city_card.dart';
import 'package:ra_cozy/widget/space_card.dart';
import 'package:ra_cozy/widget/tips_card.dart';

class HomePage extends StatelessWidget {
  get edgeInsets => null;
  get padding => null;

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: edge,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 24,
              ),
              // NOTE: TITLE/HEADER
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "Explore Now",
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Mencari kosan yang cozy",
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: POPULAR CITIES
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Popular Cities",
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(
                      City(
                        id: 1,
                        name: "Jakarta",
                        imageUrl: "assets/images/city1.png",
                        isPopular: false,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 2,
                        name: "Bandung",
                        imageUrl: "assets/images/city2.png",
                        isPopular: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 3,
                        name: "Surabaya",
                        imageUrl: "assets/images/city3.png",
                        isPopular: false,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: POPULAR CITIES
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Recommended Space",
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: FutureBuilder(
                  future: spaceProvider.getRecomendedSpace(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = (snapshot.data as List<Space>);

                      int index = 0;
                      return Column(
                          children: data.map((item) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(item));
                      }).toList());
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: Tips &  Guidance
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Tips & Guidance",
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TipsCard(
                      Tips(
                        imageUrl: "assets/images/tips1.png",
                        name: 'City Guidelines',
                        date: 'Updated 20 Apr',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(
                      Tips(
                        imageUrl: "assets/images/tips2.png",
                        name: 'Jakarta Fairship',
                        date: 'Updated 11 Dec',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50 + 24,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: "assets/images/icon_home.png",
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_mail.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_card.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_love.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
