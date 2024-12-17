import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_space/core/presentation/dialog/loading_dialog.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';
import 'package:story_space/main/presentation/cubit/main_cubit.dart';
import 'package:story_space/main/presentation/cubit/main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocListener<MainCubit, MainState>(
        listenWhen: (previous, current) {
          return previous.logoutState != current.logoutState; // make sure that we only listen on LogoutState;
        },
        listener: (context, state) {
          final logoutState = state.logoutState;
          if (logoutState.isLoading) {
            showLoadingDialog(context);
            return;
          }

          context.pop(); // dismiss dialog;

          if (logoutState.isError) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(context.getString.errorLogoutMsg),
                ),
              );
            return;
          }

          context.go('/stories');
        },
        child: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (value) {
            if (value == 2) {
              context.read<MainCubit>().logout();
              return;
            }
            _currentPageIndex = value;
            if (value == 0) {
              context.go('/stories');
            } else {
              context.go('/account');
            }
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_rounded),
              label: context.getString.stories,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: context.getString.account,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.logout_rounded),
              label: context.getString.logout,
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}
