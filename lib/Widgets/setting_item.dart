import 'package:flutter/material.dart';
import 'package:pcd/Widgets/forward_button.dart';
class SettingItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function() onTap;
  final String? value;
  final Color textColor;

  const SettingItem({
    required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    this.textColor = Colors.black,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(  // Retirez le `const` ici
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            const Spacer(),
            value != null
                ? Text(
                    value!,
                    style: TextStyle(  // Retirez le `const` ici
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(width: 20),
            ForwardButton(
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
