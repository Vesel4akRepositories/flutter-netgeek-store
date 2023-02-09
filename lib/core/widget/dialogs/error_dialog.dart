import 'package:flutter/material.dart';
import 'package:netgeek/core/widget/gap/gap.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Error',
                    style: themeData.textTheme.titleLarge,
                  ),
                  const CloseButton(),
                ],
              ),
              const Gap(16),
              Text(
                message,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: themeData.textTheme.bodyLarge,
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ок'),
              ),
              const Gap(16),
            ],
          ),
        ],
      ),
    );
  }
}
