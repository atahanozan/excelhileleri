import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:excel_hileleri_mobil/ui/helper/text_helper.dart';
import 'package:excel_hileleri_mobil/ui/styles/color_style.dart';
import 'package:excel_hileleri_mobil/ui/styles/text_style.dart';
import 'package:excel_hileleri_mobil/ui/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class YapayZekaPage extends StatefulWidget {
  const YapayZekaPage({super.key});

  @override
  State<YapayZekaPage> createState() => _YapayZekaPageState();
}

class _YapayZekaPageState extends State<YapayZekaPage> {
  final TextEditingController _message = TextEditingController();
  final List<String> messages = [];
  late OpenAI? openAI;

  @override
  void initState() {
    openAI = OpenAI.instance.build(
      token: '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',
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
      ),
      enableLog: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    setState(() {
      messages.insert(
        0,
        "You: ${_message.text}",
      );
    });

    final request = ChatCompleteText(
      model: ChatModel.gptTurbo0301,
      messages: [
        {
          'role': 'user',
          'content': _message.text,
        }
      ],
      maxToken: 200,
    );
    _message.clear();
    final response = await openAI!.onChatCompletion(request: request);
    for (var element in response!.choices) {
      setState(() {
        messages.insert(0, "Bot: ${element.message!.content}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightGreen,
      appBar: const CustomAppBar(title: "Soru Sor"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(
              TextUtilities.soruSor,
              style: CustomTextStyle.subtitleText,
            ),
            Flexible(
                child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                List name = messages[index].split(":");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: name[0] == "You"
                            ? CustomColors.lightYellow
                            : CustomColors.lightRed,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      messages[index],
                      style: CustomTextStyle.bodyText,
                    ),
                  ),
                );
              },
            )),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _message,
                    style: CustomTextStyle.bodyText,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelStyle: CustomTextStyle.bodyText,
                      labelText: "Soru Sor...",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      _sendMessage();
                    },
                    child: Icon(
                      Icons.send_rounded,
                      color: Colors.greenAccent.shade700,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
