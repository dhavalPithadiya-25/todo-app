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
  const _LoginForm({super.key});

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
            PasswordInputField(controller: _passwordController, label: "Enter your password", title: "Password"),
            const Gap(Spacing.xSmall),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text("Forgot password ?", style: textTheme.labelMedium?.copyWith(color: color.primary)),
              ),
            ),
            const Gap(Spacing.normal),
            FilledButton(onPressed: () {}, child: const Text("Login")),
            const Gap(Spacing.normal),
            const TextDivider(text: "OR"),
            FilledButton.icon(
              onPressed: () {},
              icon: Image.asset(AppIcons.googleLogo,height: 24),
              label: const Text("Sign up with goggle"),
            )
          ],
        ),
      ),
    );
  }
}
