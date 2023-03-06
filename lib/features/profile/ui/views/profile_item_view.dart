import 'package:flutter/material.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/profile/models/profile_item.dart';

class ProfileItemView extends StatelessWidget {
  final ProfileItem item;

  const ProfileItemView({
    Key? key,
    required this.item,
  }) : super(key: key);

  void _openUrl(){

  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return GestureDetector(
      onTap: _openUrl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: themeData.textTheme.titleMedium,
                ),
                Gap(10),
                Text(
                  item.description,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: themeData.dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
