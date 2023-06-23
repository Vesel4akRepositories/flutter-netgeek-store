// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netgeek/core/injection/register_module.dart' as _i22;
import 'package:netgeek/core/network/api_helper.dart' as _i10;
import 'package:netgeek/core/storage/database.dart' as _i3;
import 'package:netgeek/features/cart/data/cart_repository.dart' as _i4;
import 'package:netgeek/features/cart/ui/bloc/cart_bloc.dart' as _i9;
import 'package:netgeek/features/categories/bloc/categories_bloc.dart' as _i20;
import 'package:netgeek/features/categories/data/categories_repository.dart'
    as _i15;
import 'package:netgeek/features/checkout/bloc/checkout_bloc.dart' as _i21;
import 'package:netgeek/features/checkout/data/checkout_repository.dart'
    as _i16;
import 'package:netgeek/features/login/bloc/auth_bloc.dart' as _i8;
import 'package:netgeek/features/login/bloc/login_bloc.dart' as _i17;
import 'package:netgeek/features/login/data/login_repository.dart' as _i11;
import 'package:netgeek/features/login/data/token_repository.dart' as _i6;
import 'package:netgeek/features/products/bloc/products_bloc.dart' as _i18;
import 'package:netgeek/features/products/data/products_repository.dart'
    as _i12;
import 'package:netgeek/features/registration/bloc/registration_bloc.dart'
    as _i19;
import 'package:netgeek/features/registration/data/registration_repository.dart'
    as _i13;
import 'package:netgeek/features/wishlist/bloc/wishlist_bloc.dart' as _i14;
import 'package:netgeek/features/wishlist/logic/wishlist_repository.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppDb>(_i3.AppDb());
  gh.factory<_i4.CartRepository>(() => _i4.CartRepository(get<_i3.AppDb>()));
  gh.singleton<_i5.FlutterSecureStorage>(registerModule.secureStorage);
  gh.lazySingleton<_i6.TokenRepository>(
      () => _i6.TokenRepository(get<_i5.FlutterSecureStorage>()));
  gh.factory<_i7.WishlistRepository>(
      () => _i7.WishlistRepository(get<_i3.AppDb>()));
  gh.lazySingleton<_i8.AuthBloc>(
      () => _i8.AuthBloc(get<_i6.TokenRepository>()));
  gh.lazySingleton<_i9.CartBloc>(() => _i9.CartBloc(get<_i4.CartRepository>()));
  gh.lazySingleton<_i10.HttpManager>(
      () => _i10.HttpManager(get<_i6.TokenRepository>()));
  gh.factory<_i11.LoginRepository>(
      () => _i11.LoginRepository(get<_i10.HttpManager>()));
  gh.factory<_i12.ProductsRepository>(
      () => _i12.ProductsRepository(get<_i10.HttpManager>()));
  gh.factory<_i13.RegistrationRepository>(
      () => _i13.RegistrationRepository(get<_i10.HttpManager>()));
  gh.lazySingleton<_i14.WishlistBloc>(
      () => _i14.WishlistBloc(get<_i7.WishlistRepository>()));
  gh.factory<_i15.CategoriesRepository>(
      () => _i15.CategoriesRepository(get<_i10.HttpManager>()));
  gh.factory<_i16.CheckoutRepository>(
      () => _i16.CheckoutRepository(get<_i10.HttpManager>()));
  gh.factory<_i17.LoginBloc>(() => _i17.LoginBloc(
        get<_i8.AuthBloc>(),
        get<_i11.LoginRepository>(),
      ));
  gh.factory<_i18.ProductsBloc>(
      () => _i18.ProductsBloc(get<_i12.ProductsRepository>()));
  gh.factory<_i19.RegistrationBloc>(
      () => _i19.RegistrationBloc(get<_i13.RegistrationRepository>()));
  gh.factory<_i20.CategoriesBloc>(
      () => _i20.CategoriesBloc(get<_i15.CategoriesRepository>()));
  gh.factory<_i21.CheckoutBloc>(
      () => _i21.CheckoutBloc(get<_i16.CheckoutRepository>()));
  return get;
}

class _$RegisterModule extends _i22.RegisterModule {}
