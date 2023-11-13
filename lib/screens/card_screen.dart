import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 44, left: 44, bottom: 12, top: 8),
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
                                'سبد خرید',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'sb',
                                    fontSize: 16,
                                    color: CustomColors.blue),
                              ),
                            ),
                            Image.asset('assets/images/icon_back.png'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 10,
                    (context, index) {
                      return const CardItem();
                    },
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 60),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.green,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: const Text(
                    'ادامه فرایند خرید',
                    style: TextStyle(fontFamily: 'sm', fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 44, right: 44, top: 10, bottom: 10),
      height: 249,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('data'),
                        const Text('data'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 17,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: CustomColors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 6),
                                  child: Text(
                                    '%3',
                                    style: TextStyle(
                                        fontFamily: 'sb',
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const Text('تومان'),
                            const Text('98,990,000'),
                          ],
                        ),
                        const Wrap(
                          textDirection: TextDirection.rtl,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            OptionsCheap(),
                            OptionsCheap(),
                            OptionsCheap(),
                            OptionsCheap(),
                            OptionsCheap(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset('assets/images/iphone.png'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(
              lineThickness: 3.0,
              dashGapLength: 4.0,
              dashColor: CustomColors.gery.withOpacity(0.5),
              dashLength: 5.0,
              dashGapColor: Colors.transparent,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('تومان'), SizedBox(width: 5), Text('94,000,000')],
            ),
          )
        ],
      ),
    );
  }
}

class OptionsCheap extends StatelessWidget {
  const OptionsCheap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: CustomColors.gery,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/icon_options.png'),
            const SizedBox(width: 10),
            const Text('data'),
          ],
        ),
      ),
    );
  }
}
