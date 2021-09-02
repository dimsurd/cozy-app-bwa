import 'package:cozy/models/city.dart';
import 'package:cozy/models/space.dart';
import 'package:cozy/models/tips.dart';
import 'package:cozy/providers/space_provider.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/bottomNavbar.dart';
import 'package:cozy/widgets/cityCard.dart';
import 'package:cozy/widgets/spaceCard.dart';
import 'package:cozy/widgets/tipsCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
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
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Mencari kosan yang cozy",
                style: greykTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: POPULAR CITIES CARD
            Padding(
              padding: EdgeInsets.only(left: edge),
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
                    width: 20,
                  ),
                  CityCard(City(1, 'Jakarta', 'assets/city1.png', false)),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(City(2, 'Bandung', 'assets/city2.png', true)),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(City(3, "Surabaya", 'assets/city3.png', false)),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(City(4, "Palembang", 'assets/city4.png', false)),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(City(5, "Aceh", 'assets/city5.png', true)),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(City(6, "Bogor", 'assets/city6.png', false)),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            // NOTE: RECOMENDED SPACE
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Recomended Space",
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecomendedSpace(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
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
            // NOTE: TIPS AND GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Tips & Guidance",
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Column(
                children: [
                  TipsCard(
                      Tips(1, "City Guidelines", "assets/tips1.png", "20 Apr")),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      2, "Jakarta Fairship", "assets/tips2.png", "11 Dec")),
                ],
              ),
            ),
            SizedBox(
              height: 70 + edge,
            ),
            // NOTE: NAVBAR BOTTOM
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbar(
              imgUrl: "assets/home.png",
              isActive: true,
            ),
            BottomNavbar(
              imgUrl: "assets/mail.png",
              isActive: false,
            ),
            BottomNavbar(
              imgUrl: "assets/card.png",
              isActive: false,
            ),
            BottomNavbar(imgUrl: "assets/love.png", isActive: false),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
