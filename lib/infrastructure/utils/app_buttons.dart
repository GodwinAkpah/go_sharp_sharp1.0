// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppAuthButton extends StatefulWidget {
  void Function()? onPressed;
  final String buttonText;
  final Color? textColor;
  final bool isLoading;
  final bool hasLeading;
  final Widget? leading;
  final ButtonStyle? style;
  AppAuthButton(
      {super.key,
      this.onPressed,
      required this.buttonText,
      this.textColor,
      this.isLoading = false,
      this.hasLeading = false,
      this.style,
      this.leading});

  @override
  State<AppAuthButton> createState() => _AppAuthButtonState();
}

class _AppAuthButtonState extends State<AppAuthButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: widget.style ??
              ElevatedButton.styleFrom(
                backgroundColor: widget.isLoading
                    ? Colors.green.withOpacity(0.3)
                    : Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.hasLeading ? widget.leading! : const SizedBox(),
                      widget.hasLeading
                          ? const SizedBox(
                              width: 10,
                            )
                          : const SizedBox(),
                      Text(
                        widget.buttonText,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Figtree',
                            color: widget.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
          )),
    );
  }
}

// ignore: must_be_immutable
