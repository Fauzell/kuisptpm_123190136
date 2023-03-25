import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'lamandetail.dart';

class LamanUtama extends StatelessWidget {
  // const LamanUtama({super.key});
  final List<Diseases> listDiseases;

  const LamanUtama({Key? key, required this.listDiseases}) : super(key: key);
  // const LamanUtama({super.key, required this.listDiseases});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plant Diseases'),
          centerTitle: true,
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: listDiseases.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              Diseases diseases = listDisease[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LamanDetail(diseases: diseases)));
                },
                child: Card(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Image.network(diseases.imgUrls,
                            width: 300,
                                fit: BoxFit.fitHeight)),
                        const SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(diseases.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(diseases.plantName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.white60,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
