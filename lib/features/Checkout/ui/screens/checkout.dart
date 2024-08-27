import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/goBack.dart';
import 'package:manzil/features/Checkout/ui/screens/payment_options.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: goBackWidget(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              buildDetails(),
              verticalSpace(20),
              const Divider(),
              bookingDetails(),
              verticalSpace(10),
              priceDetails(),
              verticalSpace(20),
              const PaymentOptions(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }

  bookingDetails() => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      // bottomLeft: Radius.circular(12),
                    ),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(5),
                        Text('check-in', style: TextStyles.fon12DarkRegular),
                        Text('1/7/2024', style: TextStyles.fon14DarkMedium),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(5),
                        Text('check-in', style: TextStyles.fon12DarkRegular),
                        Text('1/7/2024', style: TextStyles.fon14DarkMedium),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              border: Border.all(
                color: Colors.grey,
                width: 0.3,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(5),
                  Text('Number Of Beds', style: TextStyles.fon12DarkRegular),
                  Text('4', style: TextStyles.fon14DarkMedium),
                ],
              ),
            ),
          ),
        ],
      );
  Row buildDetails() {
    return Row(
      children: [
        Image.asset('assets/homel.png'),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workers Apartment With Four Beds',
              style: TextStyles.font14blueMedium,
            ),
            Text(
              'Alryan, Riyadh Saudi Arabia',
              style: TextStyles.fon12DarkRegular,
            ),
          ],
        ),
      ],
    );
  }

  priceDetails() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price details',
            style: TextStyles.fon16DarkMedium,
          ),
          verticalSpace(12),
          Row(children: [
            Text(
              '2x bed',
              style: TextStyles.fon16GreyRegular,
            ),
            const Spacer(),
            Text(
              '1750 SAR',
              style: TextStyles.fon16DarkMedium,
            ),
          ]),
          verticalSpace(8),
          Row(children: [
            Text(
              'VAT',
              style: TextStyles.fon16GreyRegular,
            ),
            const Spacer(),
            Text(
              '500 SAR',
              style: TextStyles.fon16DarkMedium,
            ),
          ]),
          verticalSpace(20),
          const Divider(),
          Row(children: [
            Text(
              'Payment type',
              style: TextStyles.fon16DarkMedium,
            ),
            const Spacer(),
            Text(
              '2250 SAR',
              style: TextStyles.font14blueSemiBold,
            ),
          ]),
          verticalSpace(50),
          const Divider(),
        ],
      );
}
