import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/color_resources.dart';
import 'login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController mobileNo = TextEditingController();



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _textEditingController.dispose();
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
                child: Text('New DAT888888888888888888888A'),
              );
            } else if (state is SuccessState) {

            }
            return Scaffold(
              appBar: AppBar(
                title: const Text('Text Field Form'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mobileSignup()
                    ],
                  ),
                ),
              ),
              bottomSheet: SizedBox(
                width: MediaQuery.of(context).size.width/1.1,
                height: MediaQuery.of(context).size.height/9,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/1.1,
                      height: MediaQuery.of(context).size.height/15,
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
                          print('-----------NEW OTP SCREEN }');
                          Navigator.pushNamed(context, AppRoutes.otpScreen);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const SecondScreen()),
                          // );
                        },
                        child: const Text('Elevated Button'),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      "anand",
                      // style: tstyleFormField,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
  mobileSignup(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome Back!",
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        const Text(
          "Hello World! This is a Text Widget.",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10,),
        TextFormField(
          magnifierConfiguration: TextMagnifierConfiguration.disabled,
          enableInteractiveSelection: false,
          controller: mobileNo,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              fillColor: Colors.red,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),

              ),
              hintText: "Enter Your Mobile no",
              prefixIcon:
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.keyboard_arrow_down),
                    // Image.asset(
                    //   'assets/flags/${state.countryCode.toString().toLowerCase()}.png',
                    //   width: signUpFlagSize,
                    //   height: signUpFlagSize,
                    // ),
                    Text(
                      " +91",
                      // style: tstyleFormField,
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              )
          ),
          onChanged: (value) {
          },
        ),
      ],
    );
  }
}
