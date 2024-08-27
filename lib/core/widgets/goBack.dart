// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manzil/core/helpers/navigate.dart';
import 'package:manzil/core/theme/colors.dart';

goBackWidget(context) => GestureDetector(
      onTap: () {
        goBack(context);
      },
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorsManager.kPrimaryColor,
        ),
      ),
    );
