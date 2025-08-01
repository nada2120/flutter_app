import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues priceRange = const RangeValues(20, 60);

  @override
  Widget build(BuildContext context) {
    double sliderMin = 0;
    double sliderMax = 100;

    return LayoutBuilder(
      builder: (context, constraints) {
        double sliderWidth = constraints.maxWidth;

        double startPercent = (priceRange.start - sliderMin) / (sliderMax - sliderMin);
        double endPercent = (priceRange.end - sliderMin) / (sliderMax - sliderMin);

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
                  min: sliderMin,
                  max: sliderMax,
                  divisions: 100,
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey[300],
                  onChanged: (values) {
                    setState(() {
                      priceRange = values;
                    });
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
                left: endX - 22 ,
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