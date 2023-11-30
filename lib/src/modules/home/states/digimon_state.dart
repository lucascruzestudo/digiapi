import 'package:digiapi/src/core/models/digimon.dart';

abstract class DigimonState {}

class DigimonInitial extends DigimonState {}

class DigimonLoading extends DigimonState {}

class DigimonLoaded extends DigimonState {
  final List<Digimon> digimons;

  DigimonLoaded({required this.digimons});
}

class DigimonError extends DigimonState {
  final String message;

  DigimonError({required this.message});
}