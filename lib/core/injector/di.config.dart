// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories_impl/characters_repository_impl.dart' as _i6;
import '../../domain/repositories/characters_repository.dart' as _i5;
import '../../presentation/bloc/character/character_bloc.dart' as _i12;
import '../../presentation/bloc/dwarves/dwarves_bloc.dart' as _i8;
import '../../presentation/bloc/elves/elves_bloc.dart' as _i9;
import '../../presentation/bloc/hobbits/hobbits_bloc.dart' as _i10;
import '../../presentation/bloc/humans/humans_bloc.dart' as _i11;
import '../api/api_manager.dart' as _i3;
import '../device_services/connectivity_service.dart' as _i7;
import '../router/app_router.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i3.ApiManager>(_i3.ApiManager());
  gh.singleton<_i4.AppRouter>(_i4.AppRouter());
  gh.factory<_i5.CharactersRepository>(
      () => _i6.CharactersRepositoryImpl(get<_i3.ApiManager>()));
  gh.factory<_i7.ConnectivityService>(() => _i7.ConnectivityService());
  gh.factory<_i8.DwarvesBloc>(
      () => _i8.DwarvesBloc(get<_i5.CharactersRepository>()));
  gh.factory<_i9.ElvesBloc>(
      () => _i9.ElvesBloc(get<_i5.CharactersRepository>()));
  gh.factory<_i10.HobbitsBloc>(
      () => _i10.HobbitsBloc(get<_i5.CharactersRepository>()));
  gh.factory<_i11.HumansBloc>(
      () => _i11.HumansBloc(get<_i5.CharactersRepository>()));
  gh.factory<_i12.CharacterBloc>(
      () => _i12.CharacterBloc(get<_i5.CharactersRepository>()));
  return get;
}
