import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/controller/chat_controller.dart';
import 'package:winlife_conselor_flutter/data/model/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final AuthController _authController = Get.find();
  var _user;
  late UserData opponent;
  var args = Get.arguments;
  final ChatController _chatController = Get.find();

  @override
  void initState() {
    super.initState();
    _loadMessages();
    _user = types.User(
        id: _authController.user.id, firstName: _authController.user.fullName);
    opponent = UserData.fromJson(args['user'], "  ");
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 144,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleImageSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Photo'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleFileSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('File'),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messages[index].copyWith(previewData: previewData);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );
    _chatController.sendMessage(message.text);
    _addMessage(textMessage);
  }

  void _loadMessages() async {
    // final response = await rootBundle.loadString('assets/messages.json');
    // final messages = (jsonDecode(response) as List)
    //     .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
    //     .toList();

    // setState(() {
    //   _messages = messages;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile/privacy.png'),
                radius: 20.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  opponent.fullName,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'neosansbold',
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
          bottom: false,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Chat(
                    theme: const DefaultChatTheme(
                        primaryColor: mainColor,
                        inputTextColor: Colors.black,
                        secondaryColor: Colors.grey,
                        sendButtonIcon: Icon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.black,
                        ),
                        inputBackgroundColor: greyColor),
                    messages: _messages,
                    onAttachmentPressed: _handleAtachmentPressed,
                    onMessageTap: _handleMessageTap,
                    onPreviewDataFetched: _handlePreviewDataFetched,
                    onSendPressed: _handleSendPressed,
                    user: _user,
                  ),
                ),
                Positioned(
                    top: 5,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        child: Card(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  '12 August 2021',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mainColor,
                                      fontFamily: "neosansbold",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13),
                                ),
                              ),
                              VerticalDivider(
                                width: 20,
                              ),
                              Container(
                                child: Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Text',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "neosansbold",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            '60 Min',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontFamily: "neosansbold",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Count Date',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "neosansbold",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            '00:59',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontFamily: "neosansbold",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                              )
                            ],
                          ),
                        ))))
              ],
            ),
          )),
    );
  }
}
