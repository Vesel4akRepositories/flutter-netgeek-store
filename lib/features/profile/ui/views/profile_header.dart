import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/gap/gap.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(kPadding),
        Text(
          'Мой профиль',
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(kPadding),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Foto_Shiba_Inu_.jpg/1200px-Foto_Shiba_Inu_.jpg',
              ),
            ),
            const Gap(kPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Denis Petrov'),
                Text('gvesel4ak@gmail.com'),
              ],
            ),
          ],
        ),
        const Gap(kPadding * 2),
      ],
    );
  }
}
