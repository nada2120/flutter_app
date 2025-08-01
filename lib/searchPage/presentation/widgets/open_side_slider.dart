import 'package:flutter/material.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../common/container_button.dart';
import '../../../common/label_widget.dart';
import '../../../common/size_button.dart';
import '../widgets/side_slider.dart';
import '../../../constants/colors.dart';
import '../../../constants/texts.dart';

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
            color: Colors.grey.withOpacity(0.3),
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
            LabelWidget(title: 'Price', widget: PriceRangeSlider()),
            const SizedBox(height: 16),
            LabelWidget(
              title: 'Color',
              widget: SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colorsFilter.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ContainerButton(
                        sizeContainer: 30,
                        colorContainer: colorsFilter[index],
                        widget: const SizedBox(),
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ContainerButton(
                        sizeContainer: 50,
                        colorBorder: Colors.black,
                        sizeBorder: 1,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star),
                            Text(stars[index]),
                          ],
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
              widget: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  items: ['Option 1', 'Option 2', 'Option 3']
                      .map(
                        (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          const Icon(Icons.category, size: 18, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(item, style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  )
                      .toList(),
                  buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black26),
                      color: Colors.white,
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ),
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
              child: SizeButton(itemButtons: buttons, defaultColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}