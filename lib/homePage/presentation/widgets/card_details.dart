import 'package:flutter/material.dart';

import '../../../constants/texts.dart';

/*class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key, required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            // padding: const EdgeInsets.all(8.0),
            child: Image.asset(NTexts.products[index].image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 4,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(NTexts.products[index].name),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${NTexts.products[index].price}'),
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF83758),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/