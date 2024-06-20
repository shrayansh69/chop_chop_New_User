import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkUtility {
  static Future<String?> fetchUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        // Successful response, return the body
        return response.body;
      } else {
        // Handle other status codes, if needed
        debugPrint('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error making request: $e');
    }

    // Return null for any error or failure
    return null;
  }
}
