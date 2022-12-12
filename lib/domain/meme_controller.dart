import 'package:get_it_tutorial/domain/models/meme.dart';
import 'package:get_it_tutorial/repository/meme_repo.dart';

import '../locator.dart';

class MemeDomainController {
  Future<Meme> getNextMeme() async {
    return await getIt.get<MemeRepo>().getMeme();
  }
}
