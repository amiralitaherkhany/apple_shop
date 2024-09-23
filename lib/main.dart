import 'package:apple_shop/bloc/basket/basket_bloc.dart';
import 'package:apple_shop/bloc/category/category_bloc.dart';
import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/cubit/basket/cubit/basket_cubit.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/models/card_item.dart';
import 'package:apple_shop/ui/screens/login_screen.dart';
import 'package:apple_shop/ui/screens/main_wrapper.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BasketItemAdapter());
  await Hive.openBox<BasketItem>('BasketBox');
  await getItInit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BasketCubit>(
          create: (context) => locator.get()..updateBasketItems(),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => locator.get()..add(CategoryRequestList()),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => locator.get()..add(HomeRequestData()),
        ),
        BlocProvider<BasketBloc>(
          create: (context) => locator.get()..add(BasketFetchFromHive()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.myWhite,
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
          selectionColor: MyColors.myBlue,
          cursorColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:
          AuthManager.readAuth().isEmpty ? LoginScreen() : const MainWrapper(),
    );
  }
}
