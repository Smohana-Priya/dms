import 'package:dms_dealers/screens/about_vehicle/about_vahicle.dart';
import 'package:dms_dealers/screens/login_page/login_bloc.dart';
import 'package:dms_dealers/screens/login_page/login_event.dart';
import 'package:dms_dealers/screens/login_page/login_screen.dart';
import 'package:dms_dealers/screens/otp_screen/otp_bloc.dart';
import 'package:dms_dealers/screens/otp_screen/otp_event.dart';
import 'package:dms_dealers/screens/otp_screen/otp_screen.dart';
import 'package:dms_dealers/utils/color_resources.dart';
import 'package:dms_dealers/utils/perference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authenticatiom/bloc/authentication_bloc.dart';
import 'authenticatiom/bloc/authentication_state.dart';

class AppRoutes {
  static const String dashboardScreen = 'dashboard_screen';
  static const String loginScreen = 'login_screen';
  static const String otpScreen = 'otp_screen';
  static const String aboutVahicle = 'about_vehicle';
  static const String profile = 'profile_screen';
}

Route<dynamic>? getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen();
    case AppRoutes.otpScreen:
      return _buildOtpScreen();
    case AppRoutes.aboutVahicle:
      return _buildAboutVahicleScreen();
    // case AppRoutes.profile:
    //   return _buildProfileScreen();
  }
  return null;
}

Route<dynamic> _buildLoginScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildLoginScreen());
}

Route<dynamic> _buildOtpScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildOtpScreen());
}

Route<dynamic> _buildAboutVahicleScreen() {
  return MaterialPageRoute(
      builder: (BuildContext context) => PageBuilder.buildAboutVahicle());
}

// Route<dynamic> _buildProfileScreen() {
//   return MaterialPageRoute(
//       builder: (BuildContext context) => PageBuilder.buildProfileScreen());
// }

class PageBuilder {
  static Widget buildLoginScreen() {
    return BlocProvider(
        create: (BuildContext context) =>
            LoginBloc()..add(LoginInitialEvent(context: context)),
        child: const LoginScreen());
  }

  static Widget buildOtpScreen() {
    return BlocProvider(
        create: (BuildContext context) =>
            OTPBloc()..add(OTPInitialEvent(context: context)),
        child: const OTPScreen());
  }

  static Widget buildAboutVahicle() {
    return const AboutVahicle();
  }

  // static Widget buildProfileScreen() {
  //   return BlocProvider(
  //       create: (BuildContext context) =>
  //           OTPBloc()..add(OTPInitialEvent(context: context)),
  //       child: const OTPScreen());
  // }
}

Widget addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (BuildContext context, Object? state) async {
      if (state is AuthenticationUnAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        bool? isLogin = true;
        await PreferenceHelper.getLoginStatus()
            .then((bool value) => isLogin = value);
        if (isLogin!) {
          //  await Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        } else {
          // await Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
        }
      }
      if (state is AuthenticationAuthenticated) {
        /* while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }*/
      }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (BuildContext context, Object? state) {
        if (state is NoInternetConnectionState) {
          return Card(
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.no_accounts_sharp,
                    size: 34,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('No Internet Connection',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: ColorResource.color641653)),
                ],
              ),
            ),
          );
        } else {
          return widget;
        }
      },
    ),
  );
}
