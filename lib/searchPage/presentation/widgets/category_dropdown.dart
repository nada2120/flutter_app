import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:team_project/api/models/category_model.dart';

class CategoryDropdown extends StatefulWidget {
  final List<Category> categories;
  final Function(String) onCategorySelected;

  const CategoryDropdown({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String? selectedValue;

  final Map<String, IconData> categoryIcons = {
    'Electronics': Iconsax.device_message,
    'Shoes': Iconsax.driver,
    'Furniture': Iconsax.frame_1,
    'Clothes': Iconsax.shopping_bag,
  };

  @override
  void initState() {
    super.initState();
    if (widget.categories.isNotEmpty) {
      selectedValue = widget.categories.first.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: selectedValue,
        items: widget.categories.map((item) {
          return DropdownMenuItem<String>(
            value: item.name,
            child: Row(
              children: [
                Icon(
                  categoryIcons[item.name] ?? Icons.category,
                  size: 18,
                  color: Colors.grey[700],
                ),
                const SizedBox(width: 8),
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.onCategorySelected(value!);
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.white,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          iconEnabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}