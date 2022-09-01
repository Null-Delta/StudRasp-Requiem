import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';
import 'logger.dart';

Future<void> initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (error) {
    logger.severe('Ошибка подключения Firebase', [error]);
  }
}

Future<bool> emailRegister(String email, String login, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "iamgirya@yandex.ru",
      password: "SuperSecretPassword!",
    );
    userCredential.user!.updateDisplayName(login);

    // занёс в таблицу логин и почту
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      logger.severe('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      logger.severe('The account already exists for that email.');
    }
  } catch (e) {
    logger.severe(e);
  }
  return false;
}

Future<bool> singIn(String login, String password) async {
  try {
    // достал из бд почту

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "iamgirya@yandex.ru",
      password: "SuperSecretPassword!",
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      logger.severe('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      logger.severe('Wrong password provided for that user.');
    }
    return false;
  } catch (e) {
    logger.severe(e);
    return false;
  }
}
