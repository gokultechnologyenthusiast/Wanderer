import 'package:flutter/material.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';

class CardCountryRow extends StatelessWidget {
  const CardCountryRow({
    Key? key,
    required this.locationData,
  }) : super(key: key);

  final LocationDataModel locationData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 16,
          width: 16,
          child: ImageIcon(
            AssetImage("assets/images/pin.png"),
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          locationData.country!,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
