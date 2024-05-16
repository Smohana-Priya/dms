// ignore_for_file: library_private_types_in_public_api

import 'package:dms_dealers/utils/color_resources.dart';
import 'package:dms_dealers/utils/contants.dart';
import 'package:dms_dealers/utils/image_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
// import '../../router.dart';
import 'login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mbleNoCntrl = TextEditingController();

  @override
  void dispose() {
    _mbleNoCntrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
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
                child: Text('Loading state'),
              );
            } else if (state is SuccessState) {}
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            Constants.welcome,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              letterSpacing: 1,
                              fontSize: 20,
                              color: ColorResource.color191919,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            Constants.hello,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: ColorResource.color404040,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _mbleNoCntrl,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                // fillColor: Colors.red,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                ),
                                hintText: Constants.enterMobileNo,
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        ImageResource.flag,
                                      ),
                                      const Text(
                                        "  +91",
                                      ),
                                      const Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                )),
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      ColorResource.primaryColor,
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    Constants.next,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ))),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(Constants.agree),
                              Text(
                                Constants.tc,
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              Text(' & '),
                              Text(
                                Constants.privacy,
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
