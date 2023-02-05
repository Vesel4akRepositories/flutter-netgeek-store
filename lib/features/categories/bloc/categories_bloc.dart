import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netgeek/core/util/handlers/exception_handler.dart';
import 'package:netgeek/features/categories/data/categories_repository.dart';
import 'package:netgeek/features/categories/models/category.dart';

part 'categories_bloc.freezed.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  factory CategoriesEvent.fetch() = _CategoriesFetchEvent;
}

@freezed
class CategoriesState with _$CategoriesState {
  CategoriesState._();

  bool get isFetching => maybeMap(
        fetching: (_) => true,
        orElse: () => false,
      );

  factory CategoriesState.idle() = CategoriesIdleState;

  factory CategoriesState.fetching() = CategoriesFetchingState;

  factory CategoriesState.fetched({required List<Category> categories}) =
      CategoriesFetchedState;

  factory CategoriesState.error({
    required Exception exception,
  }) = CategoriesErrorState;
}

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _repository;

  CategoriesBloc(this._repository) : super(CategoriesState.idle()) {
    on<CategoriesEvent>(
      (event, emitter) => event.map(
        fetch: (event) => _fetch(event, emitter),
      ),
    );
  }

  void _fetch(
    _CategoriesFetchEvent event,
    Emitter<CategoriesState> emitter,
  ) async {
    try {
      emitter(CategoriesState.fetching());
      final categories = await _repository.fetchCategories();
      emitter(CategoriesState.fetched(categories: categories));
    } catch (e) {
      print('error: $e');
      emitter(
        CategoriesState.error(
          exception: ExceptionHandler.handleError(e),
        ),
      );
    }
  }
}
