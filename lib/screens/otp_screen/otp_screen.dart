// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../base/base_state.dart';

import '../../utils/color_resources.dart';
import '../../utils/contants.dart';
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
  final _pinCntrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<OTPBloc>(context);
  }

  @override
  void dispose() {
    _pinCntrl.dispose();
    super.dispose();
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
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Align(
                                alignment: AlignmentDirectional.topStart,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )),
                            const Text(
                              Constants.otp,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: ColorResource.color191919,
                                  fontFamily: 'Poppins',
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              Constants.enterCode,
                              style: TextStyle(
                                  color: ColorResource.color191919,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Pinput(
                              preFilledWidget: const Text('0'),
                              controller: _pinCntrl,
                              separatorBuilder: (index) =>
                                  const SizedBox(width: 15),
                              defaultPinTheme: PinTheme(
                                height: 70,
                                width: 70,
                                textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(30, 60, 87, 1),
                                ),
                                decoration: BoxDecoration(
                                  color: ColorResource.lightGrey,
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(
                                      color: ColorResource.lightGrey2),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Constants.otp2,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorResource.color000000),
                                ),
                                Text(
                                  Constants.resend,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorResource.color0063F7),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(children: [
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
                                    Constants.verify,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ))),
                          const SizedBox(
                            height: 15,
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
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
