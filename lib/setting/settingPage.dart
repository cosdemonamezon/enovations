import 'package:flutter/material.dart';
import 'package:novations/login/loginPage.dart';
import 'package:novations/login/services/loginController.dart';
import 'package:novations/setting/pdpaInformationPage.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3c61a9),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/man1.png"),
                ),
                SizedBox(height: 10),
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "john.doe@example.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock, color: Color(0xff3c61a9)),
            title: Text("Change Password"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.contact_support, color: Color(0xff3c61a9)),
            title: Text("Contact Us"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info, color: Color(0xff3c61a9)),
            title: Text("About Us"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: Color(0xff3c61a9)),
            title: Text("Privacy Policy (PDPA)"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PdpaInformationPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Log Out", style: TextStyle(color: Colors.red)),
            onTap: () {
              context.read<LoginController>().clearToken().then((value) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}
