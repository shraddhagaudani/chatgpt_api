import 'package:get/get.dart';
import '../apiservice/api_service.dart';

class ChatController extends GetxController {
  final ApiService _apiService = ApiService();
  var messages = <Map<String, String>>[].obs;
  var isLoading = false.obs;

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;

    messages.add({"role": "user", "content": message});
    isLoading.value = true;

    try {
      final response = await _apiService.sendMessage(message);
      final chatResponse = response["choices"][0]["message"]["content"];

      messages.add({"role": "assistant", "content": chatResponse});
    } catch (e) {
      messages.add({"role": "assistant", "content": "Error: Failed to get response."});
    }

    isLoading.value = false;
  }
}


// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class ChatController extends GetxController {
//   var userMessage = ''.obs;
//   var botResponse = ''.obs;
//   var isLoading = false.obs;
//
//   Future<void> sendMessage(String message) async {
//     // const apiKey =
//     //     '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';
//     const apiKey = "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";
//     const url = 'https://api.openai.com/v1/chat/completions';
//
//     isLoading(true);
//     try {
//       print("Sending request to OpenAI...");
//       print("User Message: $message");
//
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $apiKey',
//         },
//         body: jsonEncode({
//           "model": "gpt-3.5-turbo",
//           "messages": [
//             {"role": "user", "content": message},
//           ],
//           "max_tokens": 100,
//         }),
//       );
//
//       print("Response Status Code: ${response.statusCode}");
//       print("Response Body: ${response.body}");
//
//       if (response.statusCode == 429) {
//         var data = jsonDecode(response.body);
//         print("Data:$data");
//         // botResponse(data['choices'][0]['message']['content']);
//         botResponse(data.toString());
//       } else {
//         botResponse('Failed to get response: ${response.statusCode} - ${response.body}');
//       }
//     } catch (e) {
//       botResponse('Error: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
// }




// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// class ChatController extends GetxController {
//   var message = ''.obs;
//   final apiKey = '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'; // Replace with your actual API key
//
//   Future<void> fetchChatResponse(String userMessage) async {
//     const url = 'https://api.openai.com/v1/chat/completions';
//
//     final headers = {
//       'Authorization': 'Bearer $apiKey',
//       'Content-Type': 'application/json',
//     };
//
//     final body = jsonEncode({
//       "model": "gpt-4o-mini",
//       "messages": [{"role": "user", "content": "Say this is a test!"}],
//       "temperature": 0.7
//       // "model": "gpt-3.5-turbo",
//       // "messages": [
//       //   {"role": "user", "content": userMessage}
//       // ]
//     });
//
//     try {
//       final response = await http.post(Uri.parse(url), headers: headers, body: body);
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final chatResponse = data['choices'][0]['message']['content'];
//         message.value = chatResponse;
//         print("Message:${message.value}");
//       } else {
//         message.value = 'Error: ${response.statusCode}';
//       }
//     } catch (e) {
//       message.value = 'Error: $e';
//     }
//   }
// }
