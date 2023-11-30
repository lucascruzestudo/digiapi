import 'package:digiapi/src/modules/home/services/digimon_service.dart';
import 'package:digiapi/src/modules/home/states/digimon_state.dart';
import 'package:flutter/material.dart';

import '../../../core/models/digimon.dart';

class DigimonController extends ValueNotifier<DigimonState> {
  final DigimonService _service;

  DigimonController({required DigimonService service})
      : _service = service,
        super(DigimonInitial());

  List<Digimon> digimons = [];

  Future<void> getDigimons(int page) async {
    try {
      final loadedDigimons = await _service.getDigimons(page);
      _appendDigimons(loadedDigimons); 
    } catch (e) {
      value = DigimonError(message: e.toString());
    }
  }

  void _appendDigimons(List<Digimon> newDigimons) {
    digimons.addAll(newDigimons);
    value = DigimonLoaded(digimons: digimons);
  }
}
