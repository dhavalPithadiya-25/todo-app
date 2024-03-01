part of './forgot_password.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return AuthLayout(
      bottom: BottomPersistenceButton(
        onPressed: _onSubmit,
        label: "Submit",
      ),
      content: Column(
        children: [
          Text(
            "Please enter your email Address. You will receive a 6-digit verification code via email.",
            style: textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
          const Gap(Spacing.normal),
          EmailInputField(controller: _emailController, title: "Email address"),
        ],
      ),
      title: "Forgot Password",
    );
  }

  void _onSubmit() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const VerificationView()));
  }
}
