import 'package:digiapi/src/core/constants/app_colors.dart';
import 'package:digiapi/src/core/constants/app_text_styles.dart';
import 'package:digiapi/src/core/models/digimon.dart';
import 'package:digiapi/src/core/widgets/body_template.dart';
import 'package:digiapi/src/modules/home/controllers/digimon_controller.dart';
import 'package:digiapi/src/modules/home/states/digimon_state.dart';
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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        currentPage += 1;
        _controller.getDigimons(currentPage);
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
                )),
            duration: const Duration(seconds: 3),
          ),
        );
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

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      isMainPage: true,
      title: 'Olá, mundo!',
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
            return ListView.builder(
              controller: _scrollController,
              itemCount: digimon.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 125,
                          height: 125,
                          child: digimon[index].images!.isNotEmpty
                              ? Image.network(
                                  digimon[index].images![0].href.toString(),
                                  fit: BoxFit.contain,
                                )
                              : const Placeholder(),
                        ),
                        const SizedBox(
                            width: 16), // Adjust as needed for spacing
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                digimon[index].name!,
                                style: AppTextStyles.title,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Release Date: ${digimon[index].releaseDate ?? "N/A"}',
                                style: AppTextStyles.regular,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Types: ${digimon[index].types?.map((type) => type.type).join(", ") ?? "N/A"}',
                                style: AppTextStyles.regular,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Attributes: ${digimon[index].attributes?.map((attribute) => attribute.attribute).join(", ") ?? "N/A"}',
                                style: AppTextStyles.regular,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
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
