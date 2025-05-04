import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/main.dart';

import '../models/product.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  ProductModel product;

  ProductScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              // Back button and favourite
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/arrow_backward_line.svg",
                    ),
                  ),
                  const Spacer(),
                  product.isFavourite
                      ? SvgPicture.asset(
                          "assets/icons/heart_filled.svg",
                          width: 30,
                          height: 30,
                        )
                      : SvgPicture.asset(
                          "assets/icons/heart.svg",
                        ),
                ],
              ),

              // Picture of the product
              SizedBox(
                height: 303,
                child: Image.asset(
                  "lib/Pictures/${product.picture}.png",
                  fit: BoxFit.fitHeight,
                ),
              ),

              // Space + Product details
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontFamily: "Hauora",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 32),
                    ),
                  ),
                  Container(
                    width: 95,
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xFFE7E7E7),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/minus.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.black54, BlendMode.srcIn),
                          ),
                          const Spacer(),
                          const Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "Hauora",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            "assets/icons/plus.svg",
                            colorFilter: const ColorFilter.mode(
                                Colors.black54, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // Space plus Colors
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: product.colorPalette[0]),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: product.colorPalette[1]),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: product.colorPalette[2]),
                  )
                ],
              ),

              // Prooduct Description
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Drawing Room Wooden Sofa Set is solid wooden sofa set which you can contrast the cushion of any color. The good sight caused ue to the furniture help us relax for a longer time.",
                style: TextStyle(
                    fontFamily: "Hauora",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 14,
                    height: 2),
              ),

              // Prooduct Price + Cart
              const SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontFamily: "Hauora",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 160,
                    height: 55,
                    decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontFamily: "Hauora",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
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
}
