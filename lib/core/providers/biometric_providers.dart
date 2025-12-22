import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/biometric_service.dart';

part 'biometric_providers.g.dart';

@riverpod
BiometricService biometricService(Ref ref) {
  return BiometricService();
}

@riverpod
Future<bool> isBiometricAvailable(Ref ref) async {
  final service = ref.watch(biometricServiceProvider);
  return await service.isBiometricAvailable();
}
