import 'package:flutter/material.dart';
import 'package:mylight/models/user.dart';
import 'package:mylight/screens/loginPage.dart';
import 'package:mylight/screens/mainDashboard.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  //User? user;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return const LoginPage();
    } else {
      return const DashboardPage();
    }
  }
}
