import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/core/widgets/icon.dart';
import 'package:manzil/features/auth/logic/bloc_state.dart';
import 'package:manzil/features/auth/ui/screen/VerificationCode.dart';
import '../../logic/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  late String phoneNumber;

  String generateCountryFlag() {
    String countryCode = 'SA';

    String flag = countryCode.toUpperCase().replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
        );

    return flag;
  }

  Future<void> _register(context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      _phoneFormKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current; // == Loding
      },
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
        }

        if (state is PhoneNumberSubmited) {
          Navigator.pop(context);
          // context.pushNamed(Routes.otpScreen, arguments: phoneNumber);
          // navigateTo(context, OtpScreen(phoneNumber: phoneNumber));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => PhoneAuthCubit(),
                child: OtpScreen(phoneNumber: phoneNumber),
              ),
            ),
          );
        }

        if (state is ErrorOccurred) {
          String errorMsg = (state).errorMsg;

          print('======================================');
          print('Error: $errorMsg');
          print('======================================');
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          IconsManger.logo,
          color: ColorsManager.kPrimaryColor,
          height: 120,
        ),
      ),
      body: Form(
        key: _phoneFormKey,
        child: Padding(
          padding: EdgeInsets.only(left: 20.h, right: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Text(
                'Welcome',
                style: TextStyles.fon20DarkMedium,
              ),
              Text(
                'please enter your number, will send you a confrmation code',
                style: TextStyles.fon16GreyMedium,
              ),
              verticalSpace(20),
              verticalSpace(20),
              MainButton(
                  text: 'Send',
                  onTap: () async {
                    showProgressIndicator(context);
                    await _register(context);
                  }),
              Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Continue as guest',
                        style: TextStyles.font14blueSemiBold,
                      ))),
              _buildPhoneNumberSubmitedBloc(),
            ],
          ),
        ),
      ),
    );
  }
}
