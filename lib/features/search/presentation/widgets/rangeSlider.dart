import 'package:flutter/material.dart';

import '../../../../../core/utilis/constants/colors.dart';


class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget(
      {Key? key,
        required this.minPriceController,
        required this.maxPriceController})
      : super(key: key);
  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(40, 120);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            'Price (for 1 night)',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              letterSpacing: 0.5,

            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: RangeSlider(
            activeColor: AppColors.teal,
            inactiveColor: AppColors.grey,
            values: _currentRangeValues,
            min: 1,
            max: 200,
            divisions: 200,
            labels: RangeLabels(
              '${_currentRangeValues.start.round().toString()}\$',
              '${_currentRangeValues.end.round().toString()}\$',
            ),
            onChanged: (RangeValues values) {
              setState(
                    () {
                  _currentRangeValues = values;
                  widget.minPriceController.text =
                      values.start.round().toString();
                  widget.maxPriceController.text =
                      values.end.round().toString();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}