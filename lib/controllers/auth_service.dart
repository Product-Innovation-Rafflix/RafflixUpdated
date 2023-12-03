import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rafflix/data.dart';
import 'package:rafflix/utils/getStoredCookie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<bool> isAuthenticated() async {
    // Simulating a delay to mimic an asynchronous network call.
    await Future.delayed(Duration(seconds: 2));

    // Get the current 'Identity' cookie value
    String identity = await getStoredCookie();
    print(identity);
    // If the cookie is blank, return false
    if (identity.isEmpty) {
      return false;
    }

    // If the cookie is not blank, send it to the server for verification
    bool isTokenValid = await verifyTokenWithServer(identity);

    return isTokenValid;
  }

  static Future<bool> verifyTokenWithServer(String token) async {
    try {
      final response = await http.get(
        Uri.parse('https://rafflixbackgroundsevice.onrender.com/'),
        headers: {
          'Content-Type': 'application/json',
          'Cookie': '$token',
        },
      );

      // Check if the response is successful (status code 200)
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Extract specific values from the response
        final balance = (responseData['data']['balance'] ?? 0).toDouble();
        final role = responseData['data']['role'] as String;

        theBalance = balance;
        status = role;
        return true;
      } else {
        // Handle other status codes as needed
        return false;
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error verifying token with server: $e');
      return false;
    }
  }

  // In a real-world scenario, you would implement login, logout, and other methods here.
  static Future<bool> login(String username, String password) async {
    // Simulate a login request.
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual login logic.
    bool loginSuccess = /* Check if login is successful */ true;

    return loginSuccess;
  }

  static Future<void> logout() async {
    // Simulate a logout request.
    await Future.delayed(Duration(seconds: 2));

    // Implement your logout logic here, e.g., clearing tokens, etc.
  }
}
