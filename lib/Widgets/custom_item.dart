import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final IconData? icon;
  final Function()? onTap; // Utilisez directement onTap
  final String? value;
  final double iconSize;
  final double containerSize;
  final Color textColor;

  const CustomItem({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
    this.icon,
    this.onTap, // Utilisez directement onTap
    this.value,
    this.iconSize = 24.0,
    this.containerSize = 50.0,
    this.textColor = Colors.white, required bool isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: GestureDetector(
        onTap: onTap, // Utilisez directement onTap
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: containerSize,
                width: containerSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                ),
                child: icon != null
                    ? Icon(
                        icon,
                        color: iconColor,
                        size: iconSize,
                      )
                    : const SizedBox(),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              const Spacer(),
              value != null
                  ? Text(
                      value!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
