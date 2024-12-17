import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_space/app_router.dart';
import 'package:story_space/main/presentation/cubit/main_cubit.dart';
import 'package:story_space/main/presentation/cubit/main_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) {
          return previous.setting != current.setting;
        },
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Story Space',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: state.setting.isDarkMode
                  ? const ColorScheme.dark(primary: Color(0xFF00B0FF))
                  : const ColorScheme.light(primary: Color(0xFF00B0FF)),
              useMaterial3: false,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
            routerConfig: AppRouter.router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.setting.locale,
          );
        },
      ),
    );
  }
}
