import 'package:flutter/material.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/gap/gap.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(kPadding),
              Text(
                'Контакы',
                style: textTheme.headlineSmall,
              ),
              const Gap(kPadding),
              Text(
                'Номера телефонов:',
                style: textTheme.bodyLarge,
              ),
              const Gap(kPadding / 2),
              const Text(
                '+7 (953) 015-79-88 (контактное лицо - Денис)',
              ),
              const Gap(kPadding),
              Text(
                'Адрес:',
                style: textTheme.bodyLarge,
              ),
              const Gap(kPadding / 2),
              const Text(
                'Россия, Чувашкска Республика, Чебоксары (лучший город), ул. Октябрьская, 22',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
