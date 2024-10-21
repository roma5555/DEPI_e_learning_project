import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> _resetPassword(String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    await user!.updatePassword(newPassword);
  }
}