import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/cubit/scroll/cubit/scroll_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(
      _scrollListener,
    );
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
    return CustomScrollView(
      controller: scrollController,
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
                    'دسته بندی',
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
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          sliver: SliverGrid.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: MyColors.myBlue,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
