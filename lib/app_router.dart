import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_space/account/presentation/account_page.dart';
import 'package:story_space/add_story/presentation/add_story_page.dart';
import 'package:story_space/add_story/presentation/cubit/add_story_cubit.dart';
import 'package:story_space/core/data/preferences/user_prefenrece.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/di/core_module.dart';
import 'package:story_space/login/presentation/cubit/login_cubit.dart';
import 'package:story_space/login/presentation/login_page.dart';
import 'package:story_space/main/presentation/cubit/main_cubit.dart';
import 'package:story_space/main/presentation/main_page.dart';
import 'package:story_space/register/presentation/cubit/register_cubit.dart';
import 'package:story_space/register/presentation/register_page.dart';
import 'package:story_space/stories/presentation/cubit/stories_cubit.dart';
import 'package:story_space/stories/presentation/stories_page.dart';
import 'package:story_space/story_detail/presentation/cubit/story_detail_cubit.dart';
import 'package:story_space/story_detail/presentation/story_detail_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/stories",
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginCubit(CoreModule.provideAuthRepository()),
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                RegisterCubit(CoreModule.provideAuthRepository()),
            child: const RegisterPage(),
          );
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) =>
                StoriesCubit(CoreModule.provideStoryRepository()),
            child: MainPage(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/stories',
            redirect: (context, state) async {
              final user = await UserPrefenrece.getUser();
              Logger.log('GoRoute.redirect(/stories) user: $user');
              if (user == null) {
                return '/login';
              }
              return null;
            },
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: StoriesPage(),
              );
            },
          ),
          GoRoute(
            path: '/account',
            pageBuilder: (context, state) {
              context.read<MainCubit>().getUser();
              return const NoTransitionPage(
                child: AccountPage(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: 'detailStory',
        path: '/detailStory/:id',
        builder: (context, state) {
          final storyId = state.pathParameters['id'] ?? '';
          Logger.log(storyId.toString());

          return BlocProvider(
            create: (context) =>
                StoryDetailCubit(CoreModule.provideStoryRepository())
                  ..getStoryDetail(id: storyId),
            child: StoryDetailPage(
              storyId: storyId,
            ),
          );
        },
      ),
      GoRoute(
        path: '/add-story',
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                AddStoryCubit(CoreModule.provideStoryRepository()),
            child: const AddStoryPage(),
          );
        },
      ),
    ],
  );
}
