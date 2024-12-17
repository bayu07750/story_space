import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_space/account/presentation/util/localization.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';
import 'package:story_space/main/presentation/cubit/main_cubit.dart';
import 'package:story_space/main/presentation/cubit/main_state.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString.account),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/seed/person/200/200',
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<MainCubit, MainState>(
                    buildWhen: (previous, current) {
                      return previous.user != current.user;
                    },
                    builder: (context, state) {
                      return Text(
                        state.user?.name ?? context.getString.guest,
                        style: context.textTheme.titleLarge,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.getString.setting,
                          style: context.textTheme.labelLarge,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                context.getString.darkMode,
                                style: context.textTheme.labelMedium,
                              ),
                            ),
                            BlocBuilder<MainCubit, MainState>(
                              buildWhen: (previous, current) {
                                return previous.setting.isDarkMode != current.setting.isDarkMode;
                              },
                              builder: (context, state) {
                                return Switch(
                                  value: state.setting.isDarkMode,
                                  onChanged: (e) {
                                    context.read<MainCubit>().setDarkMode(e);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                context.getString.language,
                                style: context.textTheme.labelMedium,
                              ),
                            ),
                            const FlagIconWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FlagIconWidget extends StatelessWidget {
  const FlagIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: const Icon(Icons.flag),
        items: AppLocalizations.supportedLocales.map((Locale locale) {
          final flag = Localization.getFlag(locale.languageCode);
          return DropdownMenuItem(
            value: locale,
            child: Center(
              child: Text(
                flag,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            onTap: () {
              context.read<MainCubit>().setLanguage(locale.languageCode);
            },
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
