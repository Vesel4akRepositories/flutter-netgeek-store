import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/injection/injection.dart';
import 'package:netgeek/core/theme/app_theme.dart';
import 'package:netgeek/core/widget/dialogs/dialogs_manager.dart';
import 'package:netgeek/features/cart/ui/bloc/cart_bloc.dart';
import 'package:netgeek/features/dashboard/ui/pages/dashboard_page.dart';
import 'package:netgeek/features/login/bloc/auth_bloc.dart';
import 'package:netgeek/features/login/bloc/login_bloc.dart';

import 'package:netgeek/features/login/ui/pages/login_page.dart';
import 'package:netgeek/features/wishlist/bloc/wishlist_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  void _unFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<AuthBloc>()
              ..add(
                const AuthEvent.started(),
              ),
          ),
          BlocProvider(
            create: (_) => getIt<CartBloc>()..add(const CartEvent.fetchItems()),
          ),
          BlocProvider(
            create: (_) => getIt<WishlistBloc>()..add(const WishlistEvent.fetchItems()),
          ),
        ],
        child: MaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: GestureDetector(
            onTap: () => _unFocus(context),
            child: const DialogsManager(
              child: _AppRouter(),
            ),
          ),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          ),
        ),
      );
}

class _AppRouter extends StatelessWidget {
  const _AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (_, state) {
        if (state is AuthenticatedState) {
          return const DashboardPage();
        } else if (state is UnauthenticatedState) {
          return BlocProvider(
            create: (_) => getIt<LoginBloc>(),
            child: const LoginPage(),
          );
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
