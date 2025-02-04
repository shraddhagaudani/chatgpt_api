import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "https://cheapest-gpt-4-turbo-gpt-4-vision-chatgpt-openai-ai-api.p.rapidapi.com/v1/chat/completions";
  static const String _apiKey = "a6984e69a2msh704573d392e5919p19114fjsn8930589af391"; // Replace with your RapidAPI Key
  static const String _host = "cheapest-gpt-4-turbo-gpt-4-vision-chatgpt-openai-ai-api.p.rapidapi.com";

  Future<Map<String, dynamic>> sendMessage(String message) async {
    final Uri url = Uri.parse(_baseUrl);

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-RapidAPI-Key": _apiKey,
      "X-RapidAPI-Host": _host,
    };

    final Map<String, dynamic> body = {
      "model": "gpt-4-turbo",
      "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": message}
      ],
      "max_tokens": 100
    };

    final response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      print("${response.statusCode}==============");
      return json.decode(response.body);
    } else {
      throw Exception("Failed to get response: ${response.body}");
    }
  }
}
