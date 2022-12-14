// Mocks generated by Mockito 5.3.2 from annotations
// in list_app_bloc/test/mocks/repositories/characters_repository_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:list_app_bloc/domain/models/character.dart' as _i8;
import 'package:list_app_bloc/domain/repositories/characters_repository.dart'
    as _i6;
import 'package:list_app_bloc/presentation/bloc/dwarves/dwarves_state.dart'
    as _i3;
import 'package:list_app_bloc/presentation/bloc/elves/elves_state.dart' as _i5;
import 'package:list_app_bloc/presentation/bloc/hobbits/hobbits_state.dart'
    as _i4;
import 'package:list_app_bloc/presentation/bloc/humans/humans_state.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHumansState_0 extends _i1.SmartFake implements _i2.HumansState {
  _FakeHumansState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDwarvesState_1 extends _i1.SmartFake implements _i3.DwarvesState {
  _FakeDwarvesState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHobbitsState_2 extends _i1.SmartFake implements _i4.HobbitsState {
  _FakeHobbitsState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeElvesState_3 extends _i1.SmartFake implements _i5.ElvesState {
  _FakeElvesState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CharactersRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharactersRepository extends _i1.Mock
    implements _i6.CharactersRepository {
  MockCharactersRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.HumansState> getHumans({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getHumans,
          [],
          {#page: page},
        ),
        returnValue: _i7.Future<_i2.HumansState>.value(_FakeHumansState_0(
          this,
          Invocation.method(
            #getHumans,
            [],
            {#page: page},
          ),
        )),
      ) as _i7.Future<_i2.HumansState>);
  @override
  _i7.Future<_i3.DwarvesState> getDwarves({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDwarves,
          [],
          {#page: page},
        ),
        returnValue: _i7.Future<_i3.DwarvesState>.value(_FakeDwarvesState_1(
          this,
          Invocation.method(
            #getDwarves,
            [],
            {#page: page},
          ),
        )),
      ) as _i7.Future<_i3.DwarvesState>);
  @override
  _i7.Future<_i4.HobbitsState> getHobbits({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getHobbits,
          [],
          {#page: page},
        ),
        returnValue: _i7.Future<_i4.HobbitsState>.value(_FakeHobbitsState_2(
          this,
          Invocation.method(
            #getHobbits,
            [],
            {#page: page},
          ),
        )),
      ) as _i7.Future<_i4.HobbitsState>);
  @override
  _i7.Future<_i5.ElvesState> getElves({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getElves,
          [],
          {#page: page},
        ),
        returnValue: _i7.Future<_i5.ElvesState>.value(_FakeElvesState_3(
          this,
          Invocation.method(
            #getElves,
            [],
            {#page: page},
          ),
        )),
      ) as _i7.Future<_i5.ElvesState>);
  @override
  _i7.Future<_i8.Character?> getCharacterById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacterById,
          [id],
        ),
        returnValue: _i7.Future<_i8.Character?>.value(),
      ) as _i7.Future<_i8.Character?>);
}
