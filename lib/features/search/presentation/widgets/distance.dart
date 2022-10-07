import 'package:flutter/material.dart';

import '../../../../../core/utilis/constants/colors.dart';

class DistanceWidget extends StatefulWidget {
  const DistanceWidget({Key? key}) : super(key: key);

  @override
  State<DistanceWidget> createState() => _DistanceWidgetState();
}

class _DistanceWidgetState extends State<DistanceWidget> {
  int _value = 5;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Distance from city center',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              letterSpacing: 0.5,

            ),
          ),
        ),
        slider(),
      ],
    );
  }

  slider() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Slider(
          value: _value.toDouble(),
          min: 0.0,
          max: 10.0,
          divisions: 100,
          activeColor: AppColors.teal,

          label: 'Less than $_value km',
          onChanged: (double newValue) {
            setState(() {
              _value = newValue.round();
            });
          },
          semanticFormatterCallback: (double newValue) {
            return '${newValue.round()} dollars';
          }),
    );
  }
}