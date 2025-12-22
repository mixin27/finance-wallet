import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// Check if biometric hardware is available on the device.
  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  /// Get a list of available biometric types (e.g., finger, face, iris).
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  /// Perform biometric authentication.
  ///
  /// [localizedReason] is the message shown to the user in the prompt.
  Future<bool> authenticate({
    required String localizedReason,
    bool stickyAuth = true,
    bool biometricOnly = true,
  }) async {
    try {
      return await _auth.authenticate(
        localizedReason: localizedReason,
        persistAcrossBackgrounding: stickyAuth,
        biometricOnly: biometricOnly,
      );
    } on PlatformException {
      return false;
    }
  }
}
