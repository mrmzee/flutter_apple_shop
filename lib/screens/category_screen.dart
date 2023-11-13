import 'package:flutter/material.dart';
import 'package:flutter_application_shop/bloc/category/category_bloc.dart';
import 'package:flutter_application_shop/bloc/category/category_event.dart';
import 'package:flutter_application_shop/bloc/category/category_state.dart';

import 'package:flutter_application_shop/data/model/category.dart';
import 'package:flutter_application_shop/widgets/cached_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category>? list;

  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
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
                            'دسته بندی',
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
            ),
            // SliverToBoxAdapter(
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       var repository = CategoryRepository();
            //       var either = await repository.getCategories();
            //       either.fold((l) {
            //         print(l);
            //       }, (r) {
            //         setState(() {
            //           list = r;
            //         });
            //         print(list![0].thumbnail);
            //       });
            //     },
            //     child: Text('data'),
            //   ),
            // ),

            BlocBuilder(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return SliverToBoxAdapter(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryResponseState) {
                  return state.response.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (r) {
                    return listCategory(list: r);
                  });
                }
                return SliverToBoxAdapter(
                  child: Text('error'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class listCategory extends StatelessWidget {
  listCategory({Key? key, required this.list}) : super(key: key);
  List<Category>? list;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return CachedImage(ImageUrl: list?[index].thumbnail!);
        }, childCount: list?.length ?? 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
