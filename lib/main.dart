import 'package:dms_dealers/router.dart';
import 'package:dms_dealers/screens/splash/splash_screen.dart';
import 'package:dms_dealers/utils/app_themes.dart';
import 'package:dms_dealers/utils/color_resources.dart';
import 'package:dms_dealers/widgets/bloc.dart';
import 'package:dms_dealers/widgets/flutter_core_widgets.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'authenticatiom/bloc/authentication_bloc.dart';
import 'authenticatiom/bloc/authentication_event.dart';
import 'screens/about_vehicle/about_vahicle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = EchoBlocDelegate();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) {
        return AuthenticationBloc()..add(AppStarted(context: context));
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends CoreWidgets {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends CoreWidgetsState<MyApp> {
  Locale? _locale;
  AuthenticationBloc? bloc;
  String? generateTokes;

  @override
  void initState() {
    bloc = BlocProvider.of<AuthenticationBloc>(context);
    //toCheckInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorResource.color954535,
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.light,
    ));
    return DynamicTheme(
      themeCollection: AppThemes().getThemeCollections(),
      builder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'dms',
          locale: _locale,
          theme: theme,
          supportedLocales: const [
            Locale('en', ''),
            Locale('ar', ''),
            Locale('hi', '')
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          localeResolutionCallback:
              (Locale? locale, Iterable<Locale> supportedLocales) {
            for (Locale supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          onGenerateRoute: getRoute,
          debugShowCheckedModeBanner: false,
          // home: addAuthBloc(
          //   context,
          //   const Splash(),
          // ),
          home: AboutVahicle(),
        );
      },
    );
  }
}
