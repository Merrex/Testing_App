import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/screens/favorites.dart';

import '../finder/finders.dart';
import 'base.screen.dart';

class FavoriteScreen extends BaseScreen {
  FavoriteScreen(WidgetTester tester) : super(tester);

  Future<bool> isPresentOnFavoritesPage() async {
    return (await element(findByType<FavoritesPage>()).isPresent());
  }
}
