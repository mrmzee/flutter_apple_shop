import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      width: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Expanded(child: Container()),
              Image.asset('assets/images/iphone.png'),
              Positioned(
                top: 0,
                right: 10,
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/images/active_fav_product.png')),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    child: Text(
                      '%3',
                      style: TextStyle(
                          fontFamily: 'sb', fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10, right: 10),
                child: Text(
                  'آیفون 13 پرومکس',
                  style: TextStyle(fontFamily: 'sm', fontSize: 14),
                ),
              ),
              Container(
                height: 53,
                decoration: const BoxDecoration(
                  color: CustomColors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.blue,
                      blurRadius: 25,
                      spreadRadius: -12,
                      offset: Offset(0, 15),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'تومان',
                        style: TextStyle(
                            fontFamily: 'sm',
                            fontSize: 11,
                            color: Colors.white),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '49,800,000',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontFamily: 'sm',
                                fontSize: 11,
                                color: Colors.white),
                          ),
                          Text(
                            '48,800,000',
                            style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 17,
                        child: Image.asset(
                            'assets/images/icon_right_arrow_cricle.png'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
