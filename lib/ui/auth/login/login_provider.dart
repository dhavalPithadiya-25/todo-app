part of './login.dart';

final class LoginProvider extends ChangeNotifier {
  LoginProvider({
    required this.context,
    required this.loadingHandler,
  });

  final BuildContext context;
  final LoadingHandler loadingHandler;

  Future<void> onLogin({
    required String email,
    required String password,
  }) async {
    try {
      loadingHandler.handleLoading(true);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      loadingHandler.handleLoading(false);
      if (context.mounted) showErrorMessage(context: context, title: "error", content: "${e.message}");
    }
  }

  Future<void> onGoggleSignIn() async {
    final googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  }
}
