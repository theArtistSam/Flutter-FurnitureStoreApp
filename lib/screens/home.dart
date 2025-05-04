import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/screens/product.dart';

import '../models/product.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int gridCount() {
      // 197
      if (width > 160) {
        return (width ~/ 160).toInt();
      }
      return 1;
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 55),
            child: Column(children: [
              // Main Text and Home Button
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Find the home furniture",
                      style: TextStyle(
                          fontFamily: "Hauora",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      "assets/icons/menu.svg",
                    ),
                  ),
                ],
              ),

              // List View of Suggestions
              const SizedBox(height: 15),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: suggestions.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                        width: 8); // Adjust the width as per your requirement
                  },
                  itemBuilder: (context, index) {
                    return suggestionTile(suggestions[index]);
                  },
                ),
              ),

              // Space plus produts
              SizedBox(
                // items * 220 <Height of the tile>
                height: (products.length / gridCount()).ceilToDouble() * 280,
                child: MasonryGridView.count(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: gridCount(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return productTile(context, products[index]);
                    }),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: backgroundColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  colorFilter:
                      const ColorFilter.mode(accentColor, BlendMode.srcIn),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  "assets/icons/scan.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  "assets/icons/account.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
                ),
              ),
              label: '',
            ),
          ],
          // currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          // onTap: _onItemTapped,
        ));
  }

  Widget productTile(BuildContext context, ProductModel product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(product: product)),
        );
      },
      child: Stack(
        children: [
          const SizedBox(
            width: 160,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 160,
              height: 220,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Picture
                Image.asset("assets/images/${product.picture}.png"),
                Row(
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontFamily: "Hauora",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    //const SizedBox(width: 35),
                    const Spacer(),
                    product.isFavourite
                        ? SvgPicture.asset("assets/icons/heart_filled.svg")
                        : SvgPicture.asset(
                            "assets/icons/heart.svg",
                            width: 18,
                            height: 18,
                          ),
                  ],
                ),
                // Colors
                Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: product.colorPalette[0]),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: product.colorPalette[1]),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: product.colorPalette[2]),
                    )
                  ],
                ),

                // Space + Price + Add Button
                const SizedBox(height: 35),
                Row(
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                          fontFamily: "Hauora",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    // Check this!
                    const Spacer(),
                    //const SizedBox(width: 50),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: accentColor),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/plus.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget suggestionTile(pictureName) {
    return Container(
      width: 70,
      height: 80,
      decoration: BoxDecoration(
          // const Color(0xFFCFCFCF)
          color: Colors.white,
          borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: SizedBox(
          // width: 37,
          // height: 41,
          child: SvgPicture.asset(
            "assets/icons/$pictureName.svg",
          ),
        ),
      ),
    );
  }
}
