import 'package:flutter/material.dart';
import 'package:ra_cozy/models/tips.dart';
import 'package:ra_cozy/theme.dart';

// ignore: must_be_immutable
class TipsCard extends StatelessWidget {
  late final Tips tips;
  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            tips.imageUrl,
            width: 80,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.name,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                tips.date,
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
            ),
          ),
        ],
      ),
    );
  }
}
