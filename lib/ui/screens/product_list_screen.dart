import 'package:apple_shop/bloc/categoryProduct/bloc/category_product_bloc.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/models/category.dart';
import 'package:apple_shop/models/product.dart';
import 'package:apple_shop/ui/widgets/card_item.dart';
import 'package:apple_shop/util/responsive.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/scroll/cubit/scroll_cubit.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    super.key,
    required this.category,
  });
  final Category category;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(
      _scrollListener,
    );
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      context.read<ScrollCubit>().hide();
    } else {
      context.read<ScrollCubit>().show();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CategoryProductBloc, CategoryProductState>(
          builder: (context, state) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                if (state is CategoryProductInitial ||
                    state is CategoryProductLoading) ...[
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 250,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: MyColors.myBlue,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                if (state is CategoryProductResponse) ...[
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: Responsive.scaleFromFigma(context, 10),
                    ),
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    expandedHeight: Responsive.scaleFromFigma(context, 46),
                    floating: true,
                    pinned: false,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Responsive.scaleFromFigma(context, 44)),
                      child: Container(
                        width: Responsive.scaleFromFigma(context, 340),
                        height: Responsive.scaleFromFigma(context, 46),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Text(
                              widget.category.title!,
                              style: TextStyle(
                                fontFamily: 'SB',
                                fontSize:
                                    Responsive.scaleFromFigma(context, 16),
                                color: MyColors.myBlue,
                              ),
                            ),
                            Positioned(
                              left: Responsive.scaleFromFigma(context, 15),
                              child: Icon(
                                IconsaxOutline.filter,
                                size: Responsive.scaleFromFigma(context, 30),
                              ),
                            ),
                            Positioned(
                              right: Responsive.scaleFromFigma(context, 5),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                    IconsaxOutline.arrow_circle_right),
                                iconSize:
                                    Responsive.scaleFromFigma(context, 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: Responsive.scaleFromFigma(context, 32),
                    ),
                  ),
                  state.productList.fold(
                    (exception) {
                      return SliverToBoxAdapter(
                        child: Text(
                          textAlign: TextAlign.center,
                          exception,
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: Responsive.scaleFromFigma(context, 16),
                            color: MyColors.myBlue,
                          ),
                        ),
                      );
                    },
                    (productList) {
                      if (productList.isNotEmpty) {
                        return ProductGrid(productlist: productList);
                      } else {
                        return SliverToBoxAdapter(
                          child: Text(
                            textAlign: TextAlign.center,
                            'محصولی دراین دسته بندی وجود ندارد',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: Responsive.scaleFromFigma(context, 16),
                              color: MyColors.myBlue,
                            ),
                          ),
                        );
                      }
                    },
                  )
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.productlist,
  });
  final List<Product> productlist;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.scaleFromFigma(context, 38)),
      sliver: SliverGrid.builder(
        itemCount: productlist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Responsive.scaleFromFigma(context, 20),
          mainAxisSpacing: Responsive.scaleFromFigma(context, 20),
          mainAxisExtent: Responsive.scaleFromFigma(context, 216),
        ),
        itemBuilder: (context, index) {
          return CardItem(product: productlist[index]);
        },
      ),
    );
  }
}
