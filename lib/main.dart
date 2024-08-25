import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Chat> chats = List.generate(
    10,
        (index) => Chat(
      name: 'Marwan',
      message: 'Hello Maroo',
      time: '05:20PM',
      imageUrl: 'https://i.postimg.cc/TwzjJsJ5/343003694-133114176402934-6239834214155657695-n.jpg',
      isOnline: true,  // Assuming all are online for demonstration
    ),
  );

  final List<Chat> people = List.generate(
    10,
        (index) => Chat(
      name: 'Adham',
      message: '',
      time: '',
      imageUrl: 'https://i.postimg.cc/TwzjJsJ5/343003694-133114176402934-6239834214155657695-n.jpg',
      isOnline: true,  // Assuming all are online for demonstration
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: people.length,
              itemBuilder: (context, index) {
                return PersonListItem(person: people[index]);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatListItem(chat: chats[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PersonListItem extends StatelessWidget {
  final Chat person;

  PersonListItem({required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(person.imageUrl),
              ),
              if (person.isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            person.name,
            style: TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final Chat chat;

  ChatListItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(chat.imageUrl),
          ),
          if (chat.isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        chat.name,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(chat.message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chat.time,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 5),
          Icon(Icons.circle, color: Colors.blue, size: 10),
        ],
      ),
    );
  }
}

class Chat {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool isOnline;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    required this.isOnline,
  });
}
