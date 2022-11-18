import 'package:flutter/material.dart';

import '../components/sections/actions.dart';
import '../components/sections/header.dart';
import '../components/sections/points_exchange.dart';
import '../components/sections/recent_activities.dart';

class Home extends StatelessWidget {
  const Home({required this.api, Key? key}) : super(key: key);
  final Future<String> api;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              api: this.api,
            ), // cuidado com o const
            const RecentActivity(),
            const ActionsSection(),
            const PointsExchange(),
          ],
        ),
      ),
    );
  }
}
