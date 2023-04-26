import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:resedentialapp/screen/admin/adhome.dart';
import 'package:resedentialapp/screen/homepage.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String? email;
  late String userid;
  String? username;
  firebase_auth.User? _user;
  late DatabaseReference _firebaseMsgDbRef;

  get textStyle => const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  // @override
  // void initState() {
  //   final auth = FirebaseAuth.instance;
  //   dynamic user = auth.currentUser;
  //   email = user.email;
  //   userid = user.uid;
  //   getdata(email);
  //   // print("Notice :${notice}");
  //   super.initState();
  // }

  // firebase_auth.User? _user;
  // late DatabaseReference _firebaseMsgDbRef;

  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now().toUtc();
    _firebaseMsgDbRef = FirebaseDatabase.instance
        .ref()
        .child('messages/${now.year}/${now.month}/${now.day}');
    _user = firebase_auth.FirebaseAuth.instance.currentUser;
    email = _user?.email;
    getdata(email!);
  }

  Future<String?> getdata(
    String email,
  ) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection("Users");
      final name = await users.doc(email).get();
      // print(name['name'].toString())
      final data = name.data() as Map<String, dynamic>;
      username = data['name'].toString();
      setState(() {});
      // print("username: $username");
    } catch (e) {
      return 'Error fetching uers';
    }
    return username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (email == 'admin@gmail.com') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Adhome()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePAge()));
            }
          },
        ),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            _user == null ? 'Chatting' : 'Chatting as "$username"',
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildMessagesList(),
            const Divider(height: 2.0),
            _buildComposeMsgRow()
          ],
        ),
      ),
    );
  }

  // Builds the list of chat messages.
  Widget _buildMessagesList() {
    return Flexible(
      child: Scrollbar(
        child: FirebaseAnimatedList(
          defaultChild: const Center(child: CircularProgressIndicator()),
          query: _firebaseMsgDbRef,
          sort: (a, b) => b.key!.compareTo(a.key!),
          padding: const EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (
            BuildContext ctx,
            DataSnapshot snapshot,
            Animation<double> animation,
            int idx,
          ) =>
              _messageFromSnapshot(snapshot, animation),
        ),
      ),
    );
  }

  // Returns the UI of one message from a data snapshot.
  Widget _messageFromSnapshot(
    DataSnapshot snapshot,
    Animation<double> animation,
  ) {
    final val = snapshot.value;
    if (val == null) {
      return Container();
    }
    final json = val as Map;
    final senderName = json['senderName'] as String? ?? '?? <unknown>';
    final msgText = json['text'] as String? ?? '??';
    final sentTime = json['timestamp'] as int? ?? 0;
    final senderPhotoUrl = json['senderPhotoUrl'] as String?;
    final messageUI = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: senderPhotoUrl != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(senderPhotoUrl),
                  )
                : CircleAvatar(
                    child: Text(senderName[0]),
                  ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(senderName,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  DateTime.fromMillisecondsSinceEpoch(sentTime).toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(msgText),
              ],
            ),
          ),
        ],
      ),
    );
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: messageUI,
    );
  }

  // Builds the row for composing and sending message.
  Widget _buildComposeMsgRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 200,
              decoration:
                  const InputDecoration.collapsed(hintText: "Send a message"),
              controller: _textController,
              onChanged: (String text) =>
                  setState(() => _isComposing = text.isNotEmpty),
              onSubmitted: _onTextMsgSubmitted,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _isComposing
                ? () => _onTextMsgSubmitted(_textController.text)
                : null,
          ),
        ],
      ),
    );
  }

  // Triggered when text is submitted (send button pressed).
  Future<void> _onTextMsgSubmitted(String text) async {
    // Make sure _user is not null.
    _user ??= firebase_auth.FirebaseAuth.instance.currentUser;
    // Clear input text field.
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    // Send message to firebase realtime database.
    _firebaseMsgDbRef.push().set({
      'senderId': _user!.uid,
      'senderName': username,
      'text': text,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
