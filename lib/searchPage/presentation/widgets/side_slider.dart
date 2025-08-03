import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  final double sliderMin;
  final double sliderMax;
  final Function(RangeValues)? onChanged;

  const PriceRangeSlider({
    super.key,
    this.sliderMin = 0,
    this.sliderMax = 100,
    this.onChanged,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  late RangeValues priceRange;

  @override
  void initState() {
    super.initState();
    priceRange = RangeValues(widget.sliderMin + 20, widget.sliderMin + 60);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double sliderWidth = constraints.maxWidth;

        double startPercent = (priceRange.start - widget.sliderMin) / (widget.sliderMax - widget.sliderMin);
        double endPercent = (priceRange.end - widget.sliderMin) / (widget.sliderMax - widget.sliderMin);

        double startX = sliderWidth * startPercent;
        double endX = sliderWidth * endPercent;

        return SizedBox(
          width: sliderWidth,
          height: 70,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: RangeSlider(
                  values: priceRange,
                  min: widget.sliderMin,
                  max: widget.sliderMax,
                  divisions: 100,
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey[300],
                  onChanged: (values) {
                    setState(() {
                      priceRange = values;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(values);
                    }
                  },
                ),
              ),
              Positioned(
                left: startX + 5,
                top: 40,
                child: Text(
                  '\$${priceRange.start.round()}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: endX - 22,
                top: 40,
                child: Text(
                  '\$${priceRange.end.round()}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}