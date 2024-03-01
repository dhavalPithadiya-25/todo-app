part of './verification.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final TextEditingController _otpController = TextEditingController();
  final ValueNotifier<String?> _error = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return AuthLayout(
      bottom: BottomPersistenceButton(
        onPressed: () {},
        label: "Verify",
      ),
      content: Column(
        children: [
          Text(
            "Please check your email for the 6-digit verification code and enter it below",
            style: textTheme.labelMedium?.copyWith(fontSize: 16),
          ),
          const Gap(Spacing.normal),
          ValueListenableBuilder(
            valueListenable: _error,
            builder: (context, error, _) => OtpInputField(
              error: error,
              controller: _otpController,
              onChanged: _onOtpChanged,
            ),
          ),
          VerificationTimer(
            duration: const Duration(seconds: 10),
            onResend: (value) {
              value.call();
            },
          ),
        ],
      ),
      title: "Verification",
    );
  }

  void _onOtpChanged(String value) {
    _error.value = Validator.otpValidation(value);
  }
}
