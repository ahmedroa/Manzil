import 'package:flutter/material.dart';

class ApplePay extends StatelessWidget {
  const ApplePay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 40,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: MaterialButton(
            onPressed: () {},
            child: const Text(
              'Apple Pay',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }
}
