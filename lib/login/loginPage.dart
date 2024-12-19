import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novations/home/firstPage.dart';
import 'package:novations/login/services/loginController.dart';
import 'package:novations/widgets/LoadingDialog.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String device_no = '';
  String notify_token = '';
  //FirebaseMessaging? messaging;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await requestNotificationPermission();
      getToken();
      getdeviceId();
    });

    OneSignal.Notifications.addClickListener((event) {});
  }

  void getdeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      // ดึงข้อมูล Android ID
      final androidInfo = await deviceInfo.androidInfo;
      device_no = androidInfo.id;
      //log('Android ID: ${androidInfo.id}');
    } else if (Platform.isIOS) {
      // ดึงข้อมูล Identifier for Vendor (iOS)
      final iosInfo = await deviceInfo.iosInfo;
      print('iOS Identifier: ${iosInfo.identifierForVendor}');
    }
  }

  void getToken() async {
    //inspect(OneSignal.User);
    var playerId = OneSignal.User.pushSubscription.id;
    //log(playerId ?? '');
    notify_token = playerId!;
  }

  Future<void> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.notification.isGranted) {
        print("Notification permission already granted");
      } else {
        var status = await Permission.notification.request();
        if (status.isGranted) {
          print("Notification permission granted");
        } else if (status.isDenied) {
          print("Notification permission denied");
        } else if (status.isPermanentlyDenied) {
          print("Notification permission permanently denied");
          openAppSettings();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<LoginController>(builder: (context, controller, child) {
          return Form(
            key: loginFormKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo Section
                      Image.asset(
                        'assets/icons/S__16834627_01.jpg',
                        height: size.height * 0.24,
                        fit: BoxFit.fill,
                        //color: Colors.red,
                      ),
                      SizedBox(height: size.height * 0.02),

                      // Email Input
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),

                      // Password Input
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),

                      // Login Button
                      ElevatedButton(
                        onPressed: () async {
                          if (loginFormKey.currentState!.validate()) {
                            try {
                              LoadingDialog.open(context);
                              // if (androidInfo != null) {
                              //   final notify_token = await messaging!.getToken();
                                
                              //   await controller.signIn(tel: username.text, password: password.text, deviceId: androidInfo!.id);
                              // } else if (iosInfo != null) {
                              //   await controller.signIn(tel: username.text, password: password.text, deviceId: iosInfo!.utsname.machine!);
                              //   final notify_token = await messaging?.getToken();
                              //   await controller.signIn(username: username.text, password: password.text, deviceId: iosInfo!.utsname.machine, notify_token: notify_token ?? '');

                              //   Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                              // }
                              await controller.signIn(username: username.text, password: password.text, deviceId: device_no, notify_token: notify_token);
                              if (!mounted) return;
                              LoadingDialog.close(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                            } on Exception catch (e) {
                              LoadingDialog.close(context);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff3c61a9),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16),

                      // Forgot Password
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Color(0xff3c61a9),
                        ),
                        child: Text('Forgot Password?'),
                      ),

                      SizedBox(height: 16),

                      // Register Button (Optional)
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xff3c61a9),
                          side: BorderSide(color: Color(0xff3c61a9)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
