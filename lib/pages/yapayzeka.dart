import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> messages = [];
  late OpenAI? openAI;
  String key = "";

  @override
  void initState() {
    _firestore
        .collection("SecretAPI")
        .where("name", isEqualTo: "openai")
        .get()
        .then((QuerySnapshot snapshot) {
      for (var element in snapshot.docs) {
        setState(() {
          key = element["key"];
          openAI = OpenAI.instance.build(
            token: key,
            baseOption: HttpSetup(
              receiveTimeout: const Duration(seconds: 20),
              connectTimeout: const Duration(seconds: 20),
            ),
            enableLog: true,
          );
        });
      }
    });

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
      model: GptTurbo0631Model(),
      messages: [
        Messages(
          role: Role.user,
          content: _message.text,
        )
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextField(
                            style: CustomTextStyle.bodyText,
                            controller: _message,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: "Mesajınızı yazınız...",
                              labelStyle: CustomTextStyle.bodyText,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _sendMessage();
                            },
                            child: FittedBox(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.send,
                                  color: Colors.greenAccent.shade700,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
