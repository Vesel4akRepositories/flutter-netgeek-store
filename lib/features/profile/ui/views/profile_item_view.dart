import 'package:flutter/material.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/profile/models/profile_item.dart';
import 'package:netgeek/features/profile/ui/pages/contacts_page.dart';

class ProfileItemView extends StatelessWidget {
  final ProfileItem item;

  const ProfileItemView({
    Key? key,
    required this.item,
  }) : super(key: key);

  void _openUrl(BuildContext context, {required String url}) {
    if (url.isEmpty) return;
    Widget? page;
    switch (url) {
      case 'cart':
        page = const ContactsPage();
        break;
    }

    if (page == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => page!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return GestureDetector(
      onTap: () => _openUrl(context, url: item.url),
      behavior: HitTestBehavior.opaque,
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
                const Gap(10),
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

