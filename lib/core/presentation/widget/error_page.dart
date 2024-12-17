import 'package:flutter/material.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.onRetry});

  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.getString.errorMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            OutlinedButton(
              onPressed: onRetry,
              child: Text(context.getString.retry),
            ),
          ],
        ),
      ),
    );
  }
}
