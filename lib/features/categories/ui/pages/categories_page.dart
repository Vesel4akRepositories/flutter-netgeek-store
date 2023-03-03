import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netgeek/core/constants/constants.dart';
import 'package:netgeek/features/categories/bloc/categories_bloc.dart';
import 'package:netgeek/features/categories/ui/views/category_list_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (_, state) {},
      builder: (_, state) {
        if (state.isFetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CategoriesFetchedState) {
          final categories = state.categories;

          return ListView(
            children: [
              const SizedBox(height: kPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.only(bottom: kPadding / 2),
                    child: CategoryListItem(
                      category: categories[index],
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
