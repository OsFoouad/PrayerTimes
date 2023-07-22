import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayers_times/screens/Qiblah/qiblah_direction.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  bool hasPermission = false;
  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          hasPermission = (value == PermissionStatus.granted);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPermission(),
        builder: (context, snapshot) {
          return const QiblahDireView();
        },
      ),
    );
  }
}
