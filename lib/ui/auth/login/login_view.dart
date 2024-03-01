part of './login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
      content: _LoginForm(),
      title: "Login",
      hasBackButton: false,
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final color = context.colorScheme;
    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmailInputField(controller: _emailController, title: "Email address"),
            const Gap(Spacing.normal),
            PasswordInputField(
              autofillHints: const [AutofillHints.password],
              controller: _passwordController,
              hintText: "Enter your password",
              title: "Password",
              validator: (value) => Validator.emptyFieldValidation(value, message: "password"),
            ),
            const Gap(Spacing.xSmall),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                onPressed: _onForgotPassword,
                child: Text("Forgot password ?", style: textTheme.labelMedium?.copyWith(color: color.primary)),
              ),
            ),
            const Gap(Spacing.medium),
            PrimaryButton(
              label: "Login",
              onPressed: () {},
            ),
            const Gap(Spacing.normal),
            const TextDivider(text: "OR"),
            const Gap(Spacing.normal),
            PrimaryButton.outlinedIcon(label: "Sign in with Goggle", icon: AppIcons.googleLogo, onPressed: () {}),
            const Gap(Spacing.normal),
            PrimaryButton.outlined(label: "Sign in as Guest", onPressed: () {}),
            const Gap(Spacing.xLarge),
            LinkText(
              listSpan: [
                const LinkTextSpan(text: "Don't have an account?"),
                const LinkTextSpan(text: " "),
                LinkTextSpan(
                  onPressed: _onRegister,
                  text: "Register",
                  style: context.theme.textTheme.titleSmall?.copyWith(color: context.colorScheme.primary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onForgotPassword() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordView()));
  }

  void _onRegister() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView()));
  }
}
