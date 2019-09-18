import 'package:tratar_erros_dio/src/home/subpages/create/create_bloc.dart';
import 'package:tratar_erros_dio/src/app_module.dart';
import 'package:tratar_erros_dio/src/home/home_repository.dart';
import 'package:tratar_erros_dio/src/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:tratar_erros_dio/src/home/home_page.dart';
import 'package:tratar_erros_dio/src/shared/custom_dio/custom.dio.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CreateBloc(HomeModule.to.getDependency<HomeRepository>()), singleton: false),
        Bloc((i) => HomeBloc(HomeModule.to.getDependency<HomeRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => HomeRepository(AppModule.to.getDependency<CustomDio>())),
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
