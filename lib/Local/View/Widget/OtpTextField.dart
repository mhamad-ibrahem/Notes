import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/TextStyles.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({super.key, required this.otpFunction});
  final Function(String)? otpFunction;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
        numberOfFields: 6,
        borderColor: AppColors.deepGrey,
        focusedBorderColor: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
        fieldWidth: 25,
        keyboardType: TextInputType.number,
        obscureText: false,
        showCursor: false,
        textStyle: textFormStyle(),
        showFieldAsBox: false,
        borderWidth: 4.0,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        onSubmit: otpFunction);
  }
}
