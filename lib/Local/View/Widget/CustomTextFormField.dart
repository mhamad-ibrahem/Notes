import 'package:flutter/material.dart';
import '../../../Global/Core/Constant/Colors.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/TextStyles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.obscure,
    required this.textEditingController,
    this.validator,
    this.inputType,
    this.isChat = false,
    this.isEmojeVisable = false,
    @required this.suffixIcon,
    this.onChange,
    this.onTap,
    this.focusNode,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final String hint;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  final bool isChat;
  final bool isEmojeVisable;
  final void Function()? onTap;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      style: textFormStyle(),
      obscureText: obscure,
      maxLines: 1,
      cursorColor: AppColors.deepGrey,
      keyboardType: inputType,
      decoration: InputDecoration(
          fillColor: GlobalColors.black,
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: isChat ? 0 : 10),
            child: GestureDetector(
              onTap: onTap,
              child: Icon(
                icon,
                color: AppColors.deepGrey,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
              left: 0, right: 0, top: isChat ? 5 : 20, bottom: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: isChat
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 2)),
          disabledBorder: isChat
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.primaryColor)),
          errorBorder: isChat
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: GlobalColors.red, width: 2)),
          border: isChat
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
    );
  }
}
