import 'package:digiapi/src/core/constants/app_text_styles.dart';
import 'package:digiapi/src/core/models/digimon.dart';
import 'package:flutter/material.dart';

class DigimonCard extends StatelessWidget {
  final Digimon digimon;

  const DigimonCard({Key? key, required this.digimon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          debugPrint(digimon.name!);
          // Navigate to details page
          // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(digimon: digimon)));
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      digimon.name!,
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 125,
                      height: 125,
                      child: digimon.images!.isNotEmpty
                          ? Image.network(
                              digimon.images![0].href.toString(),
                              fit: BoxFit.contain,
                            )
                          : const Placeholder(),
                    ),
                    const SizedBox(height: 8),
                    if (digimon.attributes != null &&
                        digimon.attributes!.isNotEmpty)
                      Text(
                        'Attributes: ${digimon.attributes!.map((attribute) => attribute.attribute).join(", ")}',
                        style: AppTextStyles.regular,
                      ),
                    const SizedBox(height: 8),
                    if (digimon.fields != null &&
                        digimon.fields!.isNotEmpty)
                      Text(
                        'Fields: ${digimon.fields!.map((field) => field.field).join(", ")}',
                        style: AppTextStyles.regular,
                      ),
                    const SizedBox(height: 8),
                    if (digimon.releaseDate != null)
                      Text(
                        'Release Date: ${digimon.releaseDate}',
                        style: AppTextStyles.regular,
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('Navigate to details page');
                
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                  color: Color.fromARGB(255, 209, 209, 209),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
