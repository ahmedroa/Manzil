import 'package:flutter/material.dart';
import 'package:manzil/core/theme/styles.dart';

class DetailsDownloadContract extends StatelessWidget {
  const DetailsDownloadContract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Number of reservation',
              style: TextStyles.fon10GreyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
