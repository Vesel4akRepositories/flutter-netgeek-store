// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netgeek/core/injection/register_module.dart' as _i6;
import 'package:netgeek/core/network/api_helper.dart' as _i3;
import 'package:netgeek/features/login/bloc/login_bloc.dart' as _i4;
import 'package:netgeek/features/login/data/login_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.HttpManager>(() => registerModule.httpManager);
  gh.factory<_i4.LoginBloc>(() => _i4.LoginBloc(get<dynamic>()));
  gh.factory<_i5.LoginRepository>(
      () => _i5.LoginRepository(get<_i3.HttpManager>()));
  return get;
}

class _$RegisterModule extends _i6.RegisterModule {}
