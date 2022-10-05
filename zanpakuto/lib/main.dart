import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zanpakuto/blocs/auth/auth_bloc.dart';
import 'package:zanpakuto/blocs/chat/chat_bloc.dart';
import 'package:zanpakuto/blocs/cubits/guest/guest_cubit.dart';
import 'package:zanpakuto/blocs/user/user_bloc.dart';
import 'package:zanpakuto/controllers/menu_controller.dart';
import 'package:zanpakuto/controllers/navigation_controller.dart';
import 'package:zanpakuto/pages/home/homepage.dart';
import 'package:get/get.dart';
import 'package:zanpakuto/pages/signin/login_screen.dart';
import 'package:zanpakuto/repositories/repositories.dart';
import 'package:zanpakuto/utils/custom_themes.dart';

void main() async {
  Get.put(MenuController());
  Get.put(NavigationController());
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository()),
        RepositoryProvider<ChatRepository>(
            create: (context) => ChatRepository()),
        RepositoryProvider<ChatMessageRepository>(
            create: (context) => ChatMessageRepository()),
        RepositoryProvider<UserRepository>(
            create: (context) => UserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(
              create: (context) => GuestCubit(
                  authRepository: context.read<AuthRepository>(),
                  authBloc: context.read<AuthBloc>())),
          BlocProvider(
            create: (context) => ChatBloc(
              chatMessageRepository: context.read<ChatMessageRepository>(),
              chatRepository: context.read<ChatRepository>(),
            ),
          ),
          BlocProvider(
              create: (context) =>
                  UserBloc(userRepository: context.read<UserRepository>())),
        ],
        child: MaterialApp(
          title: 'Zanpakuto',
          debugShowCheckedModeBanner: false,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          themeMode: ThemeMode.system,
          home: const LoginScreen(),
          // home: const HomePage(),
        ),
      ),
    );
  }
}
