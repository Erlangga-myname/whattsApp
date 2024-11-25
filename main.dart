import 'package:flutter/material.dart';

class WhatsAppScreen extends StatefulWidget {
  const WhatsAppScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppScreen> createState() => _WhatsAppScreenState();
}

class _WhatsAppScreenState extends State<WhatsAppScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54), // Warna hijau khas WhatsApp
        title: const Text('WhatsApp'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.groups)),
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Community Tab', style: TextStyle(fontSize: 18))),
          _buildChatsTab(),
          _buildStatusTab(),
          _buildCallsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF25D366),
        child: const Icon(Icons.message),
      ),
    );
  }

  Widget _buildChatsTab() {
    return ListView(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/WhatsApp_logo.svg/2048px-WhatsApp_logo.svg.png'),
          ),
          title: const Text('Erlangga (Anda)'),
          subtitle: const Text('cv_20241123_115615_000...'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('23/11/24'),
              Icon(Icons.push_pin),
            ],
          ),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text('Rachman'),
          subtitle: const Text('Siap! Nanti saya kirim.'),
          trailing: const Text('22/11/24'),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.group, color: Colors.white),
          ),
          title: const Text('Grup Diskusi'),
          subtitle: const Text('Jangan lupa presentasi besok!'),
          trailing: const Icon(Icons.volume_off),
        ),
      ],
    );
  }

  Widget _buildStatusTab() {
    return ListView(
      children: [
        ListTile(
          leading: Stack(
            children: const [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                child: Icon(Icons.person, color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(Icons.add_circle, color: Colors.green),
              ),
            ],
          ),
          title: const Text('My Status'),
          subtitle: const Text('Tap to add status update'),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Recent updates'),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text('Rachman'),
          subtitle: const Text('10 minutes ago'),
        ),
      ],
    );
  }

  Widget _buildCallsTab() {
    return ListView(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(Icons.phone, color: Colors.white),
          ),
          title: const Text('Rachman'),
          subtitle: Row(
            children: const [
              Icon(Icons.call_received, color: Colors.red, size: 16),
              SizedBox(width: 4),
              Text('Today, 12:30 PM'),
            ],
          ),
          trailing: const Icon(Icons.phone),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.video_call, color: Colors.white),
          ),
          title: const Text('Grup Diskusi'),
          subtitle: Row(
            children: const [
              Icon(Icons.call_made, color: Colors.green, size: 16),
              SizedBox(width: 4),
              Text('Yesterday, 10:00 PM'),
            ],
          ),
          trailing: const Icon(Icons.video_call),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WhatsAppScreen(),
  ));
}