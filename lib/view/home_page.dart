import 'package:flutter/material.dart';
import 'package:get_it_tutorial/domain/meme_controller.dart';
import 'package:get_it_tutorial/domain/models/meme.dart';

import '../locator.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Meme? visibleMeme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: visibleMeme != null
            ? Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Fact : ${visibleMeme?.fact}",
                          style: const TextStyle(fontSize: 36),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: visibleMeme != null
                              ? Image.network(visibleMeme!.image)
                              : const Placeholder(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(child: Text("No Meme loaded yet")),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_next),
        onPressed: () async {
          final Meme meme =
              await getIt.get<MemeDomainController>().getNextMeme();

          setState(() {
            visibleMeme = meme;
          });
        },
      ),
    );
  }
}
