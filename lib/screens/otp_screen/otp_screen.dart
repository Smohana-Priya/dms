

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'otp_bloc.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late OTPBloc bloc;
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileNo = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<OTPBloc>(context);

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
            } else if (state is SuccessState) {

            }
            return  SafeArea(
              child: Scaffold(

                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[otpScreen()],
                    ),
                  ),
                ),
                bottomSheet: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 9,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontStyle: FontStyle.normal),
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(1))),
                            shadowColor: Colors.lightBlue,
                          ),
                          onPressed: () {

                          },
                          child: const Text('Elevated Button'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "anand",
                        // style: tstyleFormField,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
  otpScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Otp",
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Hello World! This is a Text Widget.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/9,
          child: PinCodeTextField(
            autoDisposeControllers: false,
            appContext: context,
            length: 4,
            autoFocus: true,
            hintCharacter: '0',
            // obscureText: '!state.isOTPShow!',
            obscuringCharacter: "*",
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 70,
              fieldWidth: 80,
              activeColor:Colors.grey,
              inactiveColor:Colors.grey,
              selectedColor:Colors.black,
              // activeFillColor: Colors.transparent,
            ),
            // animationDuration: const Duration(milliseconds: 300),
            // backgroundColor: Colors.blue.shade50,
            // enableActiveFill: true,
            controller: mobileNo,
            onCompleted: (v) {},
            beforeTextPaste: (text) {
              debugPrint("Allowing to paste $text");
              return true;
            },
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Hello World! This is a Text Widget.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}