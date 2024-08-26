import 'dart:ui';

import 'package:apple_shop/constants/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 46.0,
              floating: true,
              pinned: false,
              flexibleSpace: Padding(
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
                        'آیفون',
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
                      const Positioned(
                        right: 15,
                        child: Icon(
                          IconsaxOutline.arrow_circle_right,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                textAlign: TextAlign.center,
                'SE 2022 آیفون  ',
                style: TextStyle(
                  fontFamily: 'SB',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 284,
                margin: const EdgeInsets.symmetric(horizontal: 44),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.0335),
                      offset: const Offset(0, 2.77),
                      blurRadius: 2.21,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.0412),
                      offset: const Offset(0, 6.65),
                      blurRadius: 5.32,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.0455),
                      offset: const Offset(0, 12.52),
                      blurRadius: 10.02,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              IconsaxBold.star,
                              color: Color(0xffFFBF00),
                              size: 28,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: Text(
                                '4.6',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: double.infinity,
                              child: Image.asset('assets/images/iphone.png'),
                            ),
                            const Spacer(),
                            const Icon(
                              IconsaxBold.heart_circle,
                              color: MyColors.myGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              right: index == 0 ? 35 : 0,
                            ),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: MyColors.myGrey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/product_picture.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'انتخاب رنگ',
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.myRed,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.myRed,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.myRed,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'انتخاب حافظه داخلی',
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                              width: 0.5,
                              color: MyColors.myGrey,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '128',
                              style: TextStyle(
                                fontFamily: 'SB',
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                              width: 0.5,
                              color: MyColors.myGrey,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '128',
                              style: TextStyle(
                                fontFamily: 'SB',
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                              width: 0.5,
                              color: MyColors.myGrey,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '128',
                              style: TextStyle(
                                fontFamily: 'SB',
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44.0),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors.myGrey,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          IconsaxOutline.arrow_circle_left,
                          color: MyColors.myBlue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'مشاهده',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 12,
                            color: MyColors.myBlue,
                          ),
                        ),
                        Spacer(),
                        Text(
                          ':مشخصات فنی ',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44.0),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors.myGrey,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          IconsaxOutline.arrow_circle_left,
                          color: MyColors.myBlue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'مشاهده',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 12,
                            color: MyColors.myBlue,
                          ),
                        ),
                        Spacer(),
                        Text(
                          ':توضیحات محصول ',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44.0),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors.myGrey,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        const Icon(
                          IconsaxOutline.arrow_circle_left,
                          color: MyColors.myBlue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'مشاهده',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 12,
                            color: MyColors.myBlue,
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                            ),
                            Positioned(
                              right: 18,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 36,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.yellow,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 54,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 72,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: MyColors.myGrey,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: const Center(
                                  child: Text(
                                    '+10',
                                    style: TextStyle(
                                      fontFamily: 'SB',
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          ':نظرات کاربران',
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 38,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 44.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceTagButton(),
                    AddToBasketButton(),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: 140,
          height: 47,
          decoration: BoxDecoration(
            color: MyColors.myBlue,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: 160,
                height: 53,
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.overlay,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 1),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/background_button.png',
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'افزودن به سبد خرید',
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: 140,
          height: 47,
          decoration: BoxDecoration(
            color: MyColors.myGreen,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: 160,
                height: 53,
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.overlay,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 1),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/background_button.png',
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'تومان',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '۴۶٬۰۰۰٬۰۰۰',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            fontFamily: 'SM',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '۱۶٬۹۸۹٬۰۰۰',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 25,
                      height: 15,
                      decoration: BoxDecoration(
                        color: MyColors.myRed,
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      child: const Center(
                        child: Text(
                          '%۳',
                          style: TextStyle(
                            fontFamily: 'SB',
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}