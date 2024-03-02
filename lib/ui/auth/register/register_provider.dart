part of 'register.dart';

final class RegisterProvider extends ChangeNotifier {
  RegisterProvider({required this.context, required this.loadingHandler});

  final LoadingHandler loadingHandler;
  final BuildContext context;
  final CollectionReference<Map<String, dynamic>> _registerCollectionRef = FirebaseFirestore.instance.collection('register');

  Future<void> onRegister({
    required String createdAt,
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String password,
  }) async {
    loadingHandler.handleLoading(true);
    final user = await _createUserWithFirebaseAuth(email: emailAddress, password: password);
    if (user == null) return;
    final documentReference = await _createUserInFirestore(
      createdAt: createdAt,
      firstName: firstName,
      lastName: lastName,
      emailAddress: emailAddress,
      password: password,
      uid: user.uid,
    );
    if (documentReference != null && context.mounted) {
      loadingHandler.handleLoading(false);
      showSuccessMessage(context: context, title: "Register successfully");
      context.navigator.pop();
    }
  }

  Future<DocumentReference<Map<String, dynamic>>?> _createUserInFirestore({
    required String createdAt,
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String password,
    required String uid,
  }) async {
    try {
      final documentReference = await _registerCollectionRef.add({
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "password": password,
        "createdAt": createdAt,
        "uid": uid,
      });
      return documentReference;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) showErrorMessage(context: context, title: "error", content: e.message.toString());
      loadingHandler.handleLoading(false);
    }
    return null;
  }

  Future<User?> _createUserWithFirebaseAuth({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (firebaseException) {
      if (context.mounted) showErrorMessage(context: context, title: "error", content: firebaseException.message.toString());
      loadingHandler.handleLoading(false);
    } catch (e) {
      loadingHandler.handleLoading(false);
    }
    return null;
  }
}
