import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/core/widget/dialogs/dialogs_manager.dart';
import 'package:netgeek/core/widget/gap/gap.dart';
import 'package:netgeek/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:netgeek/features/wishlist/ui/views/wishlist_item_view.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  WishlistBloc get _wishlistBloc => context.read<WishlistBloc>();

  void _onError(Exception exception) {
    DialogsManager.of(context).showError(exception: exception);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<WishlistBloc, WishlistState>(
      listener: (_, state) {
        state.maybeMap(
          error: (state) => _onError(state.exception),
          orElse: () {},
        );
      },
      builder: (_, state) {
        final items = state.favourites;

        return items.isEmpty
            ? const Center(
                child: Text('Wishlist is empty'),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(kPadding),
                          Text(
                            'Список желаний',
                            style: textTheme.headlineSmall,
                          ),
                          const Gap(kPadding),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: items.length,
                        (_, index) => Padding(
                          padding: const EdgeInsets.only(bottom: kPadding),
                          child: WishlistItemView(
                            item: items[index],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
