part of './register.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
      content: SingleChildScrollView(child: _RegisterForm()),
      title: "Create an account",
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CommonInputField(
            title: "Name",
            controller: _nameController,
            label: "Enter your name",
            validator: (value) {
              return "";
            },
          ),
          const Gap(Spacing.normal),
          EmailInputField(controller: _emailController, title: "Email address"),
          const Gap(Spacing.normal),
          PasswordInputField(controller: _passwordController, label: "Enter password", title: "Password"),
          const Gap(Spacing.normal),
          PasswordInputField(controller: _confirmPasswordController, label: "Confirm password", title: "Confirm password"),
          const Gap(Spacing.normal),
          FilledButton(onPressed: () {}, child: const Text("Register")),
          const Gap(Spacing.normal),
          const TextDivider(text: "OR"),
          const Gap(Spacing.normal),
          LinkText(
            listSpan: [
              const LinkTextSpan(text: "Already have an account ?"),
              const LinkTextSpan(text: " "),
              LinkTextSpan(
                text: "Login",
                style: context.theme.textTheme.titleSmall?.copyWith(color: color.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    if (!(_formKey.currentState!.validate())) return;
  }
}
