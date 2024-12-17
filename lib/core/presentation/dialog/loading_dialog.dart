import 'package:flutter/material.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';

Future<dynamic> showLoadingDialog(BuildContext context) {
  return showBottomSheetDialog(
    context: context,
    child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 16,
            ),
            Text(context.getString.loading),
          ],
        ),
      ),
    ),
  );
}

Future<dynamic> showBottomSheetDialog({
  required BuildContext context,
  required Widget child,
}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    context: context,
    builder: (context) {
      return SafeArea(
        top: false,
        child: child,
      );
    },
  );
}
