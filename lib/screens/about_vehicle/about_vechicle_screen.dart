import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'about_vechicle_bloc.dart';

class AboutVehicleScreen extends StatefulWidget {
  const AboutVehicleScreen({Key? key}) : super(key: key);

  @override
  _AboutVehicleScreenState createState() => _AboutVehicleScreenState();
}

class _AboutVehicleScreenState extends State<AboutVehicleScreen> {
  late AboutVehicleBloc bloc;

  @override
  void initState() {
    print('===========');
    super.initState();
    bloc = BlocProvider.of<AboutVehicleBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {},
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is InitialState) {
              return const Center(
                child: Text('New DAT888888888888888888888A'),
              );
            } else if (state is SuccessState) {}
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                    backgroundColor: ColorResource.color0A077C,
                    // centerTitle: true,
                    title: Text("Login Page", style: TextStyle(fontSize: 12))),
                body: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(50),
                        child: Text(
                          'NEWSIT - READ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
