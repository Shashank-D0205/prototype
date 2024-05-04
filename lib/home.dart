import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Index for the selected tab
  List<ChatMessage> chatMessages = []; // List to store chat messages

  final TextEditingController _messageController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      // Show the chat bottom sheet when tapping the chat icon
      _showChatBottomSheet();
    }
  }

  void _showChatBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Remove the back button
            title: const Text('Chat Section'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: chatMessages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatBubble(
                      message: chatMessages[index],
                    );
                  },
                ),
              ),
              _buildInputField(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      ChatMessage message = ChatMessage(text: messageText, isMe: true);
      setState(() {
        chatMessages.insert(0, message); // Insert at the beginning for reverse order
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to match LoginPage theme
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
        title: const Text(
          'Yuva Anubhav',
          style: TextStyle(color: Colors.black), // Set text color for app bar title
        ),
        backgroundColor: Colors.blue, // Set a new color for the app bar background
      ),
      body: const Center(
        child: Text(
          'An easy query to ease the tech worry!',
          style: TextStyle(color: Colors.black54), // Set text color for content
        ),
      ),
      bottomNavigationBar: _buildCustomNavigationBar(),
    );
  }

  Widget _buildCustomNavigationBar() {
    return BottomAppBar(
      color: Colors.white, // Set a new color for the bottom app bar background
      shape: const CircularNotchedRectangle(),
      child: Container(
        height: 60.0,
        decoration: const BoxDecoration(
          color: Colors.blue, // Set a new color for the container
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.person, 0),
            _buildNavItem(Icons.home, 1),
            _buildNavItem(Icons.chat, 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedIndex == index ? Colors.white : Colors.grey[700], // Set icon color when selected or unselected
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
            bottomLeft: Radius.circular(message.isMe ? 20.0 : 0.0),
            bottomRight: Radius.circular(message.isMe ? 0.0 : 20.0),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: message.isMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isMe ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
