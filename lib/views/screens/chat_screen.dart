import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("AI Chat")),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => (controller.messages.isEmpty)
                ? const Center(
                  child: const Text(
                      "Ask ChatGPT something!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                )
                : ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      return Align(
                        alignment: message["role"] == "user"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: message["role"] == "user" ? Colors.blueAccent : Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(message["content"]!,
                              style: const TextStyle(color: Colors.white)),
                        ),
                      );
                    },
                  )),
          ),
          if (controller.isLoading.value) const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    controller.sendMessage(messageController.text);
                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// class ChatScreen extends StatelessWidget {
//   final ChatController controller = Get.put(ChatController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ChatGPT with GetX'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Obx(() {
//                 if (controller.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 return SingleChildScrollView(
//                   child:Text(
//                     controller.botResponse.value,
//                     style: const TextStyle(fontSize: 18),
//                   ),
//                 );
//               }),
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Enter your message',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 controller.userMessage(value);
//               },
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 if (controller.userMessage.isNotEmpty) {
//                   controller.sendMessage(controller.userMessage.value);
//                 }
//               },
//               child: const Text('Send'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'controller/chat_controller.dart';
//
// class ChatScreen extends StatelessWidget {
//   final ChatController chatController = Get.put(ChatController());
//   final TextEditingController inputController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('ChatGPT API')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Obx(() {
//                 return Text(
//                   chatController.message.value.isEmpty
//                       ? 'Ask ChatGPT something!'
//                       : chatController.message.value,
//                   style: const TextStyle(fontSize: 16),
//                 );
//               }),
//             ),
//             TextField(
//               controller: inputController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Enter your message',
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 if (inputController.text.isNotEmpty) {
//                   chatController.fetchChatResponse(inputController.text);
//                   inputController.clear();
//                 }
//               },
//               child: const Text('Send'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
