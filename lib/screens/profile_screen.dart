import 'package:flutter/material.dart';
import 'package:flutter_application_shop/widgets/category_icon_item_chip.dart';

import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 44, left: 44, bottom: 20, top: 8),
              child: Container(
                height: 46,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset('assets/images/icon_apple_blue.png'),
                      const Expanded(
                        child: Text(
                          'حساب کاربری',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'sb',
                              fontSize: 16,
                              color: CustomColors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'محمدرضا محمدزاده',
              style: TextStyle(fontFamily: 'sb', fontSize: 16),
            ),
            const Text(
              '09123456789',
              style: TextStyle(fontFamily: 'sm', fontSize: 10),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: Wrap(
                textDirection: TextDirection.rtl,
                spacing: 20,
                runSpacing: 20,
                children: [
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 10,
                color: CustomColors.gery,
              ),
            ),
            const Text(
              'v-1.0.00',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 10,
                color: CustomColors.gery,
              ),
            ),
            const Text(
              'Instagram.com/mr.mzee.ir',
              style: TextStyle(
                fontFamily: 'sm',
                fontSize: 10,
                color: CustomColors.gery,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
