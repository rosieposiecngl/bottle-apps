import 'package:artis_apps/tema.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:artis_apps/tema.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var colorIndex = 0;
  var weightIndex = 0;
  var color = kGreenColor;
  var name = 'Green Drinks';
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    berubahWarna(index) {
      var newColor;
      var newName;
      if (index == 0) {
        newColor = kGreenColor;
        newName = "Green Drinks";
      } else if (index == 1) {
        newColor = kYellowColor;
        newName = "Yellow Drinks";
      } else if (index == 2) {
        newColor = kRedColor;
        newName = "Red Drinks";
      } else {
        newColor = kBlackColor;
        newName = "Black Drinks";
      }

      setState(() {
        color = newColor;
        colorIndex = index;
        name = newName;
        carouselController.animateToPage(index);
      });
    }

    berubahWeight(index) {
      setState(() {
        weightIndex = index;
      });
    }

    colorIndicator(index, indicatorColor) {
      return InkWell(
        onTap: () {
          berubahWarna(index);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: colorIndex == index ? 48 : 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      );
    }

    weightIndicator(index, title) {
      return InkWell(
        onTap: () {
          berubahWeight(index);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: weightIndex == index ? Colors.white : null,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: weightIndex == index ? color : Colors.white,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/back.png',
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/icons/search.png',
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    'assets/icons/menu.png',
                  ),
                ],
              ),
            ),
            Text(
              'Minuman Soda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 34,
            ),
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/images/product_green.png',
                ),
                Image.asset(
                  'assets/images/product_yellow.png',
                ),
                Image.asset(
                  'assets/images/product_red.png',
                ),
                Image.asset(
                  'assets/images/product_black.png',
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 0.5,
                onPageChanged: (index, reason) {
                  berubahWarna(index);
                },
              ),
              carouselController: carouselController,
            ),
            SizedBox(
              height: 34,
            ),
            Text(
              'Coca-Cola, or Coke, is a carbonated soft drink manufactured by the Coca-Cola Company. \n Originally marketed as a temperance drink and intended as a patent medicine, it was invented in the late 19th century by John Stith Pemberton in Atlanta, Georgia. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                colorIndicator(
                  0,
                  kGreenColor,
                ),
                SizedBox(
                  width: 24,
                ),
                colorIndicator(
                  1,
                  kYellowColor,
                ),
                SizedBox(
                  width: 24,
                ),
                colorIndicator(
                  2,
                  kRedColor,
                ),
                SizedBox(
                  width: 24,
                ),
                colorIndicator(
                  3,
                  kBlackColor,
                ),
              ],
            ),
            SizedBox(
              height: 34,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    weightIndicator(
                      0,
                      '0,2 kg',
                    ),
                    weightIndicator(
                      1,
                      '0,4 kg',
                    ),
                    weightIndicator(
                      2,
                      '0,6 kg',
                    ),
                    weightIndicator(
                      3,
                      '0,8 kg',
                    ),
                    weightIndicator(
                      4,
                      '1,0 kg',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 64,
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
