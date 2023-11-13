import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_shop/bloc/authentication/auth_bloc.dart';
import 'package:flutter_application_shop/bloc/category/category_bloc.dart';
import 'package:flutter_application_shop/constants/colors.dart';
import 'package:flutter_application_shop/screens/card_screen.dart';
import 'package:flutter_application_shop/screens/category_screen.dart';
import 'package:flutter_application_shop/screens/login_screen.dart';
import 'package:flutter_application_shop/screens/product_list_screen.dart';
import 'package:flutter_application_shop/screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigationIndex = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'GR'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: selectedBottomNavigationIndex,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              currentIndex: selectedBottomNavigationIndex,
              onTap: (value) {
                setState(() {
                  selectedBottomNavigationIndex = value;
                });
              },
              selectedLabelStyle: const TextStyle(
                fontFamily: 'sb',
                fontSize: 10,
                color: CustomColors.blue,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'sb',
                fontSize: 10,
                color: Colors.black,
              ),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_profile.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blue,
                              spreadRadius: -7,
                              blurRadius: 20,
                              offset: Offset(0, 13),
                            ),
                          ],
                        ),
                        child: Image.asset(
                            'assets/images/icon_profile_active.png'),
                      ),
                    ),
                    label: 'حساب کاربری'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_basket.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blue,
                              spreadRadius: -7,
                              blurRadius: 20,
                              offset: Offset(0, 13),
                            ),
                          ],
                        ),
                        child:
                            Image.asset('assets/images/icon_basket_active.png'),
                      ),
                    ),
                    label: 'سبد خرید'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_category.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blue,
                              spreadRadius: -7,
                              blurRadius: 20,
                              offset: Offset(0, 13),
                            ),
                          ],
                        ),
                        child: Image.asset(
                            'assets/images/icon_category_active.png'),
                      ),
                    ),
                    label: 'دسته بندی'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_home.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.blue,
                              spreadRadius: -7,
                              blurRadius: 20,
                              offset: Offset(0, 13),
                            ),
                          ],
                        ),
                        child:
                            Image.asset('assets/images/icon_home_active.png'),
                      ),
                    ),
                    label: 'خانه'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getScreens() {
  return <Widget>[
    const ProfileScreen(),
    const CardScreen(),
    BlocProvider(
      create: (context) => CategoryBloc(),
      child: CategoryScreen(),
    ),
    BlocProvider(
      create: (context) => AuthBloc(),
      child: LoginScreen(),
    ),
  ];
}
