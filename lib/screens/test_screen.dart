import 'package:flutter/material.dart';
import 'package:flutter_application_shop/data/datasourse/authentication_datasourse.dart';
import 'package:flutter_application_shop/data/repository/authentication_repository.dart';
import 'package:flutter_application_shop/di/di.dart';
import 'package:flutter_application_shop/utility/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  var auth =
                      AuthenticationRepository().login('kopo0010', '12345678');
                },
                child: const Text('ورود'),
              ),
              ElevatedButton(
                onPressed: () async {
                  AuthManager.logout();
                },
                child: const Text('خروج'),
              ),
              ValueListenableBuilder(
                valueListenable: AuthManager.authChangeNotifire,
                builder: (context, value, child) {
                  if (value == null || value.isEmpty) {
                    return Text('شما وارد نشدید');
                  } else
                    return Text('خوش آمدید');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
