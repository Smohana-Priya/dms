import 'package:dms_dealers/screens/drawer/drawer.dart';
import 'package:dms_dealers/screens/drawer/drawer_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutVahicle extends StatelessWidget {
  const AboutVahicle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => DrawerBloc(),
        child: Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.85,
            child: const DmsDrawer(),
          ),
          body: const Center(
            child: Center(
              child: Text('About Vahicle'),
            ),
          ),
        ),
      ),
    );
  }
}
