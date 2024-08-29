import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/helpers/extensions.dart';
import 'package:manzil/core/helpers/spacing.dart';
import 'package:manzil/core/routing/app_router.dart';
import 'package:manzil/core/theme/colors.dart';
import 'package:manzil/core/theme/styles.dart';
import 'package:manzil/core/widgets/MainButton.dart';
import 'package:manzil/features/auth/logic/bloc_state.dart';
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

  _buildPhoneFormField() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F6),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                '+966 ${generateCountryFlag()}',
                style: TextStyles.fon16DarkMedium,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                phoneNumber = value;
              },
              textAlign: TextAlign.start,
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter yout phone number!';
                } else if (value.length < 9) {
                  return 'Too short for a phone number!';
                }
                return null;
              },
              decoration: const InputDecoration(
                counter: SizedBox(),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsManager.kPrimaryColor,
                    width: 1.3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    )),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.3,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.3,
                  ),
                ),
                hintText: '512345678',
                helperStyle: TextStyle(color: Color(0xffA2A2A2)),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ],
      );

  Future<void> _register(context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
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
          print('Success');
          Navigator.pop(context);
          context.pushNamed(Routes.otpScreen, arguments: phoneNumber);
        }

        if (state is ErrorOccurred) {
          print(state.errorMsg);
          String errorMsg = (state).errorMsg;
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
      appBar: AppBar(),
      body: Form(
        key: _phoneFormKey,
        child: Padding(
          padding: EdgeInsets.only(left: 20.h, right: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: ColorsManager.containerBlue,
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
              ),
              verticalSpace(40),
              Text(
                'Welcome',
                style: TextStyles.fon20DarkMedium,
              ),
              Text(
                'please enter your number, will send you a confrmation code',
                style: TextStyles.fon16GreyMedium,
              ),
              verticalSpace(20),
              _buildPhoneFormField(),
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
                      onPressed: () {
                        context.pushNamed(Routes.bottomNavBar);
                      },
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
