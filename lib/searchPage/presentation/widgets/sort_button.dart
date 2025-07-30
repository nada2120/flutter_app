import 'package:flutter/material.dart';

import '../../../constants/texts.dart';

class SortButton extends StatefulWidget {
  const SortButton({super.key});

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlayEntry;
  String? selected;

  void showOverlay() {
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 45),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: items.map((option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      selected = option;
                    });
                    hideOverlay();
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: GestureDetector(
        onTap: () {
          if (overlayEntry == null) {
            showOverlay();
          } else {
            hideOverlay();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child:Text(
            selected ?? 'Sort',
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}



