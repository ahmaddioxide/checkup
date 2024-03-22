import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RememberMeRow extends StatefulWidget {
  // on checkbox change,
  final Function(bool?)? onRememberMeChanged;
  final Function()? onForgotPassword;

  const RememberMeRow({
    super.key,
    required this.onRememberMeChanged,
    required this.onForgotPassword,
  });

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = !_rememberMe;
                  widget.onRememberMeChanged!(_rememberMe);
                });
              },
            ),
            Text(
              'Remember me',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: widget.onForgotPassword,
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.grey,
                ),
          ),
        ),
      ],
    );
  }
}
