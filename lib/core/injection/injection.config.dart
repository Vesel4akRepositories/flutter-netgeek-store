// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netgeek/core/injection/register_module.dart' as _i15;
import 'package:netgeek/core/network/api_helper.dart' as _i6;
import 'package:netgeek/features/categories/bloc/categories_bloc.dart' as _i14;
import 'package:netgeek/features/categories/data/categories_repository.dart'
    as _i10;
import 'package:netgeek/features/login/bloc/auth_bloc.dart' as _i5;
import 'package:netgeek/features/login/bloc/login_bloc.dart' as _i11;
import 'package:netgeek/features/login/data/login_repository.dart' as _i7;
import 'package:netgeek/features/login/data/token_repository.dart' as _i4;
import 'package:netgeek/features/products/bloc/products_bloc.dart' as _i12;
import 'package:netgeek/features/products/data/products_repository.dart' as _i8;
import 'package:netgeek/features/registration/bloc/registration_bloc.dart'
    as _i13;
import 'package:netgeek/features/registration/data/registration_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i3.FlutterSecureStorage>(registerModule.secureStorage);
  gh.lazySingleton<_i4.TokenRepository>(
      () => _i4.TokenRepository(get<_i3.FlutterSecureStorage>()));
  gh.lazySingleton<_i5.AuthBloc>(
      () => _i5.AuthBloc(get<_i4.TokenRepository>()));
  gh.lazySingleton<_i6.HttpManager>(
      () => _i6.HttpManager(get<_i4.TokenRepository>()));
  gh.factory<_i7.LoginRepository>(
      () => _i7.LoginRepository(get<_i6.HttpManager>()));
  gh.factory<_i8.ProductsRepository>(
      () => _i8.ProductsRepository(get<_i6.HttpManager>()));
  gh.factory<_i9.RegistrationRepository>(
      () => _i9.RegistrationRepository(get<_i6.HttpManager>()));
  gh.factory<_i10.CategoriesRepository>(
      () => _i10.CategoriesRepository(get<_i6.HttpManager>()));
  gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc(
        get<_i5.AuthBloc>(),
        get<_i7.LoginRepository>(),
      ));
  gh.factory<_i12.ProductsBloc>(
      () => _i12.ProductsBloc(get<_i8.ProductsRepository>()));
  gh.factory<_i13.RegistrationBloc>(
      () => _i13.RegistrationBloc(get<_i9.RegistrationRepository>()));
  gh.factory<_i14.CategoriesBloc>(
      () => _i14.CategoriesBloc(get<_i10.CategoriesRepository>()));
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {}
