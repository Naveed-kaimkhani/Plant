import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/chatgpt.dart';
import 'package:plant/screens/chatmessage.dart';
import 'package:plant/screens/home_screen.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _controller = TextEditingController();
  final List<chatMessage> _message = [];
  ChatGPT chatGPT = ChatGPT();
  StreamSubscription? _subscription;

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    _subscription?.cancel();
    super.dispose();
  }

  void _sendMessage(){
    chatMessage message = chatMessage(text: _controller.text, sender: "User");

    setState(() {
      _message.insert(0, message);
    });

    _controller.clear();

    /*final request = CompleteReq(
        prompt: message.text, model: kTranslateModelV3, max_tokens: 200);
    _subscription = chatGPT!
        .builder("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", orgId: "")
        .onCompleteStream(request: request)
        .listen((response) {
      Vx.log(response!.choices[0].text);
      chatMessage botMessage =
      chatMessage(text: response.choices[0].text, sender: "bot");

      setState(() {
        _message.insert(0, botMessage);
      });*/

  }

  Widget _buildTextComposer(){
    return Row(
      children: [
        Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (value) => _sendMessage(),
              decoration: InputDecoration(
                  hintText: "Send a message",
                  filled: true,
                  fillColor: Colors.white,
                  //suffixIcon: Icon(Icons.send),
              ),
            )
        ),
        IconButton(
            onPressed: () => _sendMessage(),
            icon: const Icon(Icons.send))
      ],
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
        backgroundColor: Colors.white,
          title: const Text("Chat Screen", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),)),
      body: SafeArea(
          /*width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            Colors.purple ,Colors.orange
          ],
              begin:Alignment.topCenter, end: Alignment.bottomCenter
          )),

          alignment: Alignment(0, 0),*/
        child: Column(
          children: <Widget> [
            Flexible(child: ListView.builder(
              reverse: true,
                padding: EdgeInsets.all(20.0),
                itemCount: _message.length,
                itemBuilder: (context, index){
                  return _message[index];
                }
            )),

            Container(
                  decoration: BoxDecoration(

                  ),
                  child: _buildTextComposer(),
                )
          ],
        ),
      )
    );
  }
}
/*
Container(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
               decoration: BoxDecoration(

               ),
               child: _buildTextComposer(),
             )
          ],
        )
 */







            /*SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding:
                      MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                      ),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 14, color: Colors.white))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: const Text('Home', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)),
            ),*/
