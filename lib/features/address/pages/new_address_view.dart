import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "New Address"),
      body: FlutterMap(
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }
}
