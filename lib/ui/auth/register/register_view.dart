part of './register.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      child: const AuthLayout(
          content: SingleChildScrollView(
            child: _RegisterForm(),
          ),
          title: "Create an account"),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
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
            autofillHints: const [AutofillHints.givenName],
            textInputAction: TextInputAction.next,
            title: "First name",
            controller: _firstNameController,
            hintText: "Enter your first name",
            validator: Validator.firstNameValidation,
          ),
          const Gap(Spacing.normal),
          CommonInputField(
            autofillHints: const [AutofillHints.givenName],
            textInputAction: TextInputAction.next,
            title: "Last name",
            controller: _lastNameController,
            hintText: "Enter your last name",
            validator: Validator.lastNameValidation,
          ),
          const Gap(Spacing.normal),
          EmailInputField(
            controller: _emailController,
            title: "Email address",
            textInputAction: TextInputAction.next,
          ),
          const Gap(Spacing.normal),
          PasswordInputField(
            autofillHints: const [AutofillHints.password],
            textInputAction: TextInputAction.next,
            controller: _passwordController,
            hintText: "Enter password",
            title: "Password",
            validator: Validator.passwordValidation,
          ),
          const Gap(Spacing.normal),
          PasswordInputField(
            autofillHints: const [AutofillHints.password],
            textInputAction: TextInputAction.done,
            controller: _confirmPasswordController,
            hintText: "Enter confirm password",
            title: "Confirm password",
            validator: (value) => Validator.confirmPasswordValidation(value, password: _passwordController.text),
          ),
          const Gap(Spacing.normal),
          PrimaryButton(onPressed: _onRegister, label: "Register"),
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

  void _onRegister() {
    //if (!(_formKey.currentState!.validate())) return;
    final createdAt = DateTime.now();
    context.read<RegisterProvider>().onRegister(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          emailAddress: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          createdAt: createdAt.toUtc().toString(),
        );
  }
}
