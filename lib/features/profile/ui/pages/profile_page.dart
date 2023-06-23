import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/injection/injection.dart';
import 'package:netgeek/features/login/bloc/auth_bloc.dart';
import 'package:netgeek/features/profile/models/profile_item.dart';
import 'package:netgeek/features/profile/ui/views/profile_header.dart';
import 'package:netgeek/features/profile/ui/views/profile_item_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<ProfileItem> _profileItems = [];

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  void _loadConfig() async {
    final configFile =
        await rootBundle.loadString('assets/config/profile_config.json');
    final dynamic jsonMap = jsonDecode(configFile);
    _profileItems.addAll(jsonMap['items']
        .map<ProfileItem>((e) => ProfileItem.fromJson(e))
        .toList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ProfileHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: (_profileItems.length * 2) - 1,
              (_, index) {
                if (index.isOdd) {
                  return const Divider();
                }
                return ProfileItemView(
                  item: _profileItems[index ~/ 2],
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                Divider(),
                LogOutButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  void _logOut() => getIt<AuthBloc>().add(const AuthEvent.loggedOut());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: _logOut,
      title: const Text(
        'Выйти',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.logout),
    );
  }
}
