import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:team_project/api/bloc/product_cubit.dart';
import 'package:team_project/searchPage/presentation/manager/search_cubit.dart';
import 'package:team_project/searchPage/presentation/widgets/button.dart';

import '../../../common/container_button.dart';
import '../../../common/label_widget.dart';
import '../../../common/size_button.dart';
import '../widgets/side_slider.dart';
import '../../../constants/colors.dart';
import '../../../constants/texts.dart';
import 'category_dropdown.dart';

class FilterSheetController {
  static void show(BuildContext context) {
    showModalSideSheet(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      width: MediaQuery.of(context).size.width * 0.8,
      body: const SearchFilterSheet(),
    );
  }
}

class SearchFilterSheet extends StatefulWidget {
  const SearchFilterSheet({super.key});

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  String selectedValue = 'Option 1';
  int? isSelectedStarIndex;
  int? isSelectedColorIndex;
  double startRange = 20;
  double endRange = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(-4, 0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Filter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1, color: Color(0xFFF3F3F6)),
            const SizedBox(height: 8),
            LabelWidget(title: 'Price',
                widget: PriceRangeSlider(onChanged:
                (range){
                  startRange = range.start;
                  endRange = range.end;
                }
                )),
            const SizedBox(height: 16),
            LabelWidget(
              title: 'Color',
              widget: SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colorsFilter.length,
                  itemBuilder: (context, index) {
                    final isSelected = isSelectedColorIndex == index;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isSelectedColorIndex = index;
                          });
                        },
                        child: ContainerButton(
                          sizeContainer: 30,
                          colorContainer: colorsFilter[index],
                          widget: const SizedBox(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            LabelWidget(
              title: 'Star Rating',
              widget: SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stars.length,
                  itemBuilder: (context, index) {
                    final isSelected = isSelectedStarIndex == index;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isSelectedStarIndex = index;
                          });
                        },
                        child: ContainerButton(
                          sizeContainer: 50,
                          colorBorder: Colors.black,
                          colorContainer: isSelected ? Colors.black : Colors.white,
                          sizeBorder: 1,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: isSelected ? Colors.white : Colors.black,),
                              Text(stars[index], style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            LabelWidget(
              title: 'Category',
              gap: 8,
              widget: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoaded) {
                    final products = state.products;
                    final categories = products.map((product) => product.category).toSet().toList();

                    return CategoryDropdown(
                      categories: categories,
                      onCategorySelected: (String value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            LabelWidget(
              title: 'Discount',
              gap: 8,
              widget: SizeButton(itemButtons: discountList, defaultColor: Colors.black),
            ),
            const SizedBox(height: 32),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Button(
                     textButton: 'Cancel',
                     onTap: () {
                       Navigator.pop(context);
                     }
                 ),
                  Button(
                      textButton: 'Apply',
                      onTap: () {
                        context.read<SearchCubit>().filterProducts(startRange, endRange, selectedValue);
                        Navigator.pop(context);
                      }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}