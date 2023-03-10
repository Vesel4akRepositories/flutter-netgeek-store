import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/injection/injection.dart';
import 'package:netgeek/features/cart/ui/pages/cart_page.dart';
import 'package:netgeek/features/categories/bloc/categories_bloc.dart';
import 'package:netgeek/features/categories/ui/pages/categories_page.dart';
import 'package:netgeek/features/profile/ui/pages/profile_page.dart';
import 'package:netgeek/features/wishlist/ui/pages/wishlist_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var _selectedPageIndex = 0;

  void _onSelectTab(index) {
    setState(() {
      _selectedPageIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text('netgeek'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                getIt<CategoriesBloc>()..add(CategoriesEvent.fetch()),
          ),
        ],
        child: IndexedStack(
          index: _selectedPageIndex,
          children: const [
            CategoriesPage(),
            CartPage(),
            WishlistPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectTab,
        selectedItemColor: themeData.primaryColor,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
