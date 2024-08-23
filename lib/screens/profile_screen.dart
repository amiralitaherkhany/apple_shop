import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/widgets/category_item_chip.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Container(
                width: 340,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const Text(
                      'حساب کاربری',
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 16,
                        color: MyColors.myBlue,
                      ),
                    ),
                    Positioned(
                      left: 15,
                      top: 10,
                      child: Image.asset('assets/images/icon_apple_blue.png'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'امیرعلی طاهرخانی',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              '09942024303',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: MyColors.myGrey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.0),
              child: Wrap(
                spacing: 33,
                runSpacing: 20,
                textDirection: TextDirection.rtl,
                children: [
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                  CategoryItemChip(
                    index: 0,
                    isListed: false,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: MyColors.myGrey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'V-1.0.00',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: MyColors.myGrey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Instagram.com/Mojavad-dev',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: MyColors.myGrey,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
