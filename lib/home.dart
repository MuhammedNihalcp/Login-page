import 'package:flutter/material.dart';
import 'package:login_page/login.dart';
import 'package:login_page/screen_chat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 175, 33),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Chat',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text('Chat $index'),
                subtitle: Text('Massege $index'),
                leading: index % 2 == 0
                    ? const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        backgroundImage:
                            AssetImage('lib/assets/image/hacker.png'),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'lib/assets/image/hacker.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                trailing: Text('1$index:00 PM'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ScreenChat(name: 'Chat $index')));
                },
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: 30),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
