import 'package:digiapi/src/core/constants/app_colors.dart';
import 'package:digiapi/src/core/models/digimon.dart';
import 'package:digiapi/src/core/widgets/body_template.dart';
import 'package:digiapi/src/modules/digimons/controllers/digimon_controller.dart';
import 'package:digiapi/src/modules/digimons/states/digimon_state.dart';
import 'package:digiapi/src/modules/digimons/widgets/digimon_card.dart';
import 'package:flutter/material.dart';

import '../services/digimon_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  bool isLoading = false;
  final DigimonController _controller = DigimonController(
    service: DigimonService(),
  );
  late final ScrollController _scrollController;

  void showLoadingSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        currentPage += 1;
        _controller.getDigimons(currentPage);
        showLoadingSnackBar();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Digimon> digimon = [];

  buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildDigimonList() {
  return ListView.builder(
    controller: _scrollController,
    itemCount: digimon.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          DigimonCard(digimon: digimon[index]),
          const SizedBox(height: 16),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      isMainPage: true,
      title: 'Digimons',
      body: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, state, child) {
          if (state is DigimonInitial) {
            _controller.getDigimons(currentPage);
            return buildLoading();
          } else if (state is DigimonLoading) {
            return buildLoading();
          } else if (state is DigimonLoaded) {
            digimon = state.digimons;
            return buildDigimonList();
          } else if (state is DigimonError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
