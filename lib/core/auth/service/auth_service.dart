import 'package:flutter_kyc/core/auth/models/user.dart';
import 'package:flutter_kyc/network/network_provider.dart';

class AuthService {
  final NetworkProvider _networkProvider;
  AuthService({NetworkProvider networkProvider})
      : _networkProvider = networkProvider ?? NetworkProvider();

  Future<void> signUp(User user) async {
    try {
      const path = "signup";
      final body = user.toJson();
      final response =
          await _networkProvider.call(path, RequestMethod.post, data: body);
    } catch (error) {
      rethrow;
    }
  }

  Future<User> signIn(String email, String password) async {
    try {
      const path = "signIn";
      final body = {"email": email, "password": password};
      final response =
          await _networkProvider.call(path, RequestMethod.post, data: body);
      print(
        "Response ${response.data}",
      );
      return User.fromJson(response.data as Map<String, dynamic>);
    } catch (error) {
      rethrow;
    }
  }
}
